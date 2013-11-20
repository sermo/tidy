# Buffer structure.
#
class Tidybuf

  # Determine which importer to use (sorted by order of precedence).
  #
  if defined?(Fiddle::Importer)
    extend Fiddle::Importer
  elsif defined?(DL::Importer)
    extend DL::Importer
  else
    extend DL::Importable
  end
  
  # Access TidyBuffer instance.
  #
  attr_reader(:struct)

  # Mimic TidyBuffer.
  #
  TidyBuffer = struct [
    "TidyAllocator* allocator",
    "byte* bp",
    "unsigned int size",
    "unsigned int allocated",
    "unsigned int next"
  ]

  def initialize
    @struct = TidyBuffer.malloc
    Tidylib.buf_init(@struct)
  end
    
  # Free current contents and zero out.
  #
  def free
    Tidylib.buf_free(@struct)
  end

  # Convert to array.
  #
  def to_a
    to_s.split("\r\n")
  end

  # Convert to string.
  #
  def to_s
    @struct.bp ? @struct.bp.to_s(@struct.size) : ''
  end

end
