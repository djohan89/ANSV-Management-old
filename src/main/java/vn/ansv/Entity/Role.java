package vn.ansv.Entity;

public class Role {
	
	private int id;
	private String name;
	
	public Role() {
		super();
	}
	
	public Role(String name) {
		this.name = name;
	}
	
	public Role(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "UserRolesDto [id=" + id + ", name=" + name + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
