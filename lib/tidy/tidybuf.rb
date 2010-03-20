# Buffer structure.
#
class Tidybuf

  if RUBY_VERSION =~ /1.9/ then
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
