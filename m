Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0663D12E4
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 17:36:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88624C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 15:36:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8581C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:36:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99FVjZx014538; Wed, 9 Oct 2019 17:36:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oQLVxEkVYxKRWm0XiGUWotMcGckAuJlSjJyrZzR58Ew=;
 b=n3lrVEn80u3sAg3KIDjyhQ9eGg6hp02m0P5DjOVXbxUUexNQIVuIDwutpXv9MVUA5+/C
 iVIrAJwkaRur5IzGD8yhJDR6giNx7UgiMsjWNBueti47qizwrR/f2IV5unSnvBfPBgHy
 BQAjwQyfX04F02qdJh8OAcvmlaqfn2459Qt3qC1KIkGaaNy85b8gkNNb7qzseQE8eTw1
 9yuHlomZnERwsQpmNOBdHeTCBOnnT7581DIOQiakXedG9xJxr+kbylqgbVv/HvcDpoNe
 RNHlr9e9VvoQqBDJDAOy6hXGffP+fawfo7CLeNvNQEFBMN57IMG5uGb/YNlQFc4wpRck ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pf302-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 17:36:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDE9C100040;
 Wed,  9 Oct 2019 17:36:41 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0C122A56A7;
 Wed,  9 Oct 2019 17:36:41 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 17:36:41 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 17:36:41
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>
Date: Wed, 9 Oct 2019 17:36:25 +0200
Message-ID: <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 1/5] remoteproc: elf_loader: Add elf resource
	table load support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add rproc_elf_load_rsc_table(), which searches for a resource table in
an elf64/elf32 image, and if found, copies it to device memory.
Add also the elf32 and elf64 variants of this API.
Add a test for this.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/rproc-elf-loader.c | 269 ++++++++++++++++++++++++++++++++++
 include/remoteproc.h                  |  70 +++++++++
 test/dm/remoteproc.c                  |  91 ++++++++++--
 3 files changed, 419 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index b38a226..9127ea5 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -7,6 +7,39 @@
 #include <elf.h>
 #include <remoteproc.h>
 
+/**
+ * struct resource_table - firmware resource table header
+ * @ver: version number
+ * @num: number of resource entries
+ * @reserved: reserved (must be zero)
+ * @offset: array of offsets pointing at the various resource entries
+ *
+ * A resource table is essentially a list of system resources required
+ * by the remote processor. It may also include configuration entries.
+ * If needed, the remote processor firmware should contain this table
+ * as a dedicated ".resource_table" ELF section.
+ *
+ * Some resources entries are mere announcements, where the host is informed
+ * of specific remoteproc configuration. Other entries require the host to
+ * do something (e.g. allocate a system resource). Sometimes a negotiation
+ * is expected, where the firmware requests a resource, and once allocated,
+ * the host should provide back its details (e.g. address of an allocated
+ * memory region).
+ *
+ * The header of the resource table, as expressed by this structure,
+ * contains a version number (should we need to change this format in the
+ * future), the number of available resource entries, and their offsets
+ * in the table.
+ *
+ * Immediately following this header are the resource entries themselves.
+ */
+struct resource_table {
+	u32 ver;
+	u32 num;
+	u32 reserved[2];
+	u32 offset[0];
+} __packed;
+
 /* Basic function to verify ELF32 image format */
 int rproc_elf32_sanity_check(ulong addr, ulong size)
 {
@@ -275,3 +308,239 @@ ulong rproc_elf_get_boot_addr(struct udevice *dev, ulong addr)
 	else
 		return rproc_elf32_get_boot_addr(addr);
 }
+
+/*
+ * Search for the resource table in an ELF32 image.
+ * Returns the address of the resource table section if found, NULL if there is
+ * no resource table section, or error pointer.
+ */
+static Elf32_Shdr *rproc_elf32_find_rsc_table(struct udevice *dev,
+					      ulong fw_addr, ulong fw_size)
+{
+	int ret;
+	unsigned int i;
+	const char *name_table;
+	struct resource_table *table;
+	const u8 *elf_data = (void *)fw_addr;
+	Elf32_Ehdr *ehdr = (Elf32_Ehdr *)fw_addr;
+	Elf32_Shdr *shdr;
+
+	ret = rproc_elf32_sanity_check(fw_addr, fw_size);
+	if (ret) {
+		pr_debug("Invalid ELF32 Image %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* look for the resource table and handle it */
+	shdr = (Elf32_Shdr *)(elf_data + ehdr->e_shoff);
+	name_table = (const char *)(elf_data +
+				    shdr[ehdr->e_shstrndx].sh_offset);
+
+	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
+		u32 size = shdr->sh_size;
+		u32 offset = shdr->sh_offset;
+
+		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
+			continue;
+
+		table = (struct resource_table *)(elf_data + offset);
+
+		/* make sure we have the entire table */
+		if (offset + size > fw_size) {
+			pr_debug("resource table truncated\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		/* make sure table has at least the header */
+		if (sizeof(*table) > size) {
+			pr_debug("header-less resource table\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		/* we don't support any version beyond the first */
+		if (table->ver != 1) {
+			pr_debug("unsupported fw ver: %d\n", table->ver);
+			return ERR_PTR(-EPROTONOSUPPORT);
+		}
+
+		/* make sure reserved bytes are zeroes */
+		if (table->reserved[0] || table->reserved[1]) {
+			pr_debug("non zero reserved bytes\n");
+			return ERR_PTR(-EBADF);
+		}
+
+		/* make sure the offsets array isn't truncated */
+		if (table->num * sizeof(table->offset[0]) +
+				 sizeof(*table) > size) {
+			pr_debug("resource table incomplete\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		return shdr;
+	}
+
+	return NULL;
+}
+
+/* Load the resource table from an ELF32 image */
+int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			       ulong fw_size, ulong *rsc_addr, ulong *rsc_size)
+{
+	const struct dm_rproc_ops *ops;
+	Elf32_Shdr *shdr;
+	void *src, *dst;
+
+	shdr = rproc_elf32_find_rsc_table(dev, fw_addr, fw_size);
+	if (!shdr)
+		return -ENODATA;
+	if (IS_ERR(shdr))
+		return PTR_ERR(shdr);
+
+	ops = rproc_get_ops(dev);
+	*rsc_addr = (ulong)shdr->sh_addr;
+	*rsc_size = (ulong)shdr->sh_size;
+
+	src = (void *)fw_addr + shdr->sh_offset;
+	if (ops->device_to_virt)
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+	else
+		dst = (void *)rsc_addr;
+
+	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
+		(ulong)dst, *rsc_size);
+
+	memcpy(dst, src, *rsc_size);
+	flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+		    roundup((unsigned long)dst + *rsc_size,
+			    ARCH_DMA_MINALIGN) -
+		    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+
+	return 0;
+}
+
+/*
+ * Search for the resource table in an ELF64 image.
+ * Returns the address of the resource table section if found, NULL if there is
+ * no resource table section, or error pointer.
+ */
+static Elf64_Shdr *rproc_elf64_find_rsc_table(struct udevice *dev,
+					      ulong fw_addr, ulong fw_size)
+{
+	int ret;
+	unsigned int i;
+	const char *name_table;
+	struct resource_table *table;
+	const u8 *elf_data = (void *)fw_addr;
+	Elf64_Ehdr *ehdr = (Elf64_Ehdr *)fw_addr;
+	Elf64_Shdr *shdr;
+
+	ret = rproc_elf64_sanity_check(fw_addr, fw_size);
+	if (ret) {
+		pr_debug("Invalid ELF64 Image %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* look for the resource table and handle it */
+	shdr = (Elf64_Shdr *)(elf_data + ehdr->e_shoff);
+	name_table = (const char *)(elf_data +
+				    shdr[ehdr->e_shstrndx].sh_offset);
+
+	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
+		u64 size = shdr->sh_size;
+		u64 offset = shdr->sh_offset;
+
+		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
+			continue;
+
+		table = (struct resource_table *)(elf_data + offset);
+
+		/* make sure we have the entire table */
+		if (offset + size > fw_size) {
+			pr_debug("resource table truncated\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		/* make sure table has at least the header */
+		if (sizeof(*table) > size) {
+			pr_debug("header-less resource table\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		/* we don't support any version beyond the first */
+		if (table->ver != 1) {
+			pr_debug("unsupported fw ver: %d\n", table->ver);
+			return ERR_PTR(-EPROTONOSUPPORT);
+		}
+
+		/* make sure reserved bytes are zeroes */
+		if (table->reserved[0] || table->reserved[1]) {
+			pr_debug("non zero reserved bytes\n");
+			return ERR_PTR(-EBADF);
+		}
+
+		/* make sure the offsets array isn't truncated */
+		if (table->num * sizeof(table->offset[0]) +
+				 sizeof(*table) > size) {
+			pr_debug("resource table incomplete\n");
+			return ERR_PTR(-ENOSPC);
+		}
+
+		return shdr;
+	}
+
+	return NULL;
+}
+
+/* Load the resource table from an ELF64 image */
+int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			       ulong fw_size, ulong *rsc_addr, ulong *rsc_size)
+{
+	const struct dm_rproc_ops *ops;
+	Elf64_Shdr *shdr;
+	void *src, *dst;
+
+	shdr = rproc_elf64_find_rsc_table(dev, fw_addr, fw_size);
+	if (!shdr)
+		return -ENODATA;
+	if (IS_ERR(shdr))
+		return PTR_ERR(shdr);
+
+	ops = rproc_get_ops(dev);
+	*rsc_addr = (ulong)shdr->sh_addr;
+	*rsc_size = (ulong)shdr->sh_size;
+
+	src = (void *)fw_addr + shdr->sh_offset;
+	if (ops->device_to_virt)
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+	else
+		dst = (void *)rsc_addr;
+
+	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
+		(ulong)dst, *rsc_size);
+
+	memcpy(dst, src, *rsc_size);
+	flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+		    roundup((unsigned long)dst + *rsc_size,
+			    ARCH_DMA_MINALIGN) -
+		    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+
+	return 0;
+}
+
+/* Load the resource table from an ELF32 or ELF64 image */
+int rproc_elf_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			     ulong fw_size, ulong *rsc_addr, ulong *rsc_size)
+
+{
+	Elf32_Ehdr *ehdr = (Elf32_Ehdr *)fw_addr;
+
+	if (!fw_addr)
+		return -EFAULT;
+
+	if (ehdr->e_ident[EI_CLASS] == ELFCLASS64)
+		return rproc_elf64_load_rsc_table(dev, fw_addr, fw_size,
+						  rsc_addr, rsc_size);
+	else
+		return rproc_elf32_load_rsc_table(dev, fw_addr, fw_size,
+						  rsc_addr, rsc_size);
+}
diff --git a/include/remoteproc.h b/include/remoteproc.h
index 046cd9e..a903acb 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -277,6 +277,64 @@ int rproc_elf_load_image(struct udevice *dev, unsigned long addr, ulong size);
  * image.
  */
 ulong rproc_elf_get_boot_addr(struct udevice *dev, ulong addr);
+
+/**
+ * rproc_elf32_load_rsc_table() - load the resource table from an ELF32 image
+ *
+ * Search for the resource table in an ELF32 image, and if found, copy it to
+ * device memory.
+ *
+ * @dev:	device loading the resource table
+ * @fw_addr:	ELF image address
+ * @fw_size:	size of the ELF image
+ * @rsc_addr:	pointer to the found resource table address. Updated on
+ *		operation success
+ * @rsc_size:	pointer to the found resource table size. Updated on operation
+ *		success
+ *
+ * @return 0 if a valid resource table is successfully loaded, -ENODATA if there
+ * is no resource table (which is optional), or another appropriate error value.
+ */
+int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			       ulong fw_size, ulong *rsc_addr, ulong *rsc_size);
+/**
+ * rproc_elf64_load_rsc_table() - load the resource table from an ELF64 image
+ *
+ * Search for the resource table in an ELF64 image, and if found, copy it to
+ * device memory.
+ *
+ * @dev:	device loading the resource table
+ * @fw_addr:	ELF image address
+ * @fw_size:	size of the ELF image
+ * @rsc_addr:	pointer to the found resource table address. Updated on
+ *		operation success
+ * @rsc_size:	pointer to the found resource table size. Updated on operation
+ *		success
+ *
+ * @return 0 if a valid resource table is successfully loaded, -ENODATA if there
+ * is no resource table (which is optional), or another appropriate error value.
+ */
+int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			       ulong fw_size, ulong *rsc_addr, ulong *rsc_size);
+/**
+ * rproc_elf_load_rsc_table() - load the resource table from an ELF image
+ *
+ * Auto detects if the image is ELF32 or ELF64 image and search accordingly for
+ * the resource table, and if found, copy it to device memory.
+ *
+ * @dev:	device loading the resource table
+ * @fw_addr:	ELF image address
+ * @fw_size:	size of the ELF image
+ * @rsc_addr:	pointer to the found resource table address. Updated on
+ *		operation success
+ * @rsc_size:	pointer to the found resource table size. Updated on operation
+ *		success
+ *
+ * @return 0 if a valid resource table is successfully loaded, -ENODATA if there
+ * is no resource table (which is optional), or another appropriate error value.
+ */
+int rproc_elf_load_rsc_table(struct udevice *dev, ulong fw_addr,
+			     ulong fw_size, ulong *rsc_addr, ulong *rsc_size);
 #else
 static inline int rproc_init(void) { return -ENOSYS; }
 static inline int rproc_dev_init(int id) { return -ENOSYS; }
@@ -304,6 +362,18 @@ static inline int rproc_elf_load_image(struct udevice *dev, ulong addr,
 { return -ENOSYS; }
 static inline ulong rproc_elf_get_boot_addr(struct udevice *dev, ulong addr)
 { return 0; }
+static inline int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
+					     ulong fw_size, ulong *rsc_addr,
+					     ulong *rsc_size)
+{ return -ENOSYS; }
+static inline int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
+					     ulong fw_size, ulong *rsc_addr,
+					     ulong *rsc_size)
+{ return -ENOSYS; }
+static inline int rproc_elf_load_rsc_table(struct udevice *dev, ulong fw_addr,
+					   ulong fw_size, ulong *rsc_addr,
+					   ulong *rsc_size)
+{ return -ENOSYS; }
 #endif
 
 #endif	/* _RPROC_H_ */
diff --git a/test/dm/remoteproc.c b/test/dm/remoteproc.c
index 1d9a9b3..4067596 100644
--- a/test/dm/remoteproc.c
+++ b/test/dm/remoteproc.c
@@ -103,8 +103,8 @@ static int dm_test_remoteproc_elf(struct unit_test_state *uts)
 		0x00, 0x00, 0x00, 0x08,
 		/* phoff (program header offset @ 0x40)*/
 		0x40, 0x00, 0x00, 0x00,
-		/* shoff (section header offset : none) */
-		0x00, 0x00, 0x00, 0x00,
+		/* shoff (section header offset @ 0x90) */
+		0x90, 0x00, 0x00, 0x00,
 		/* flags */
 		0x00, 0x00, 0x00, 0x00,
 		/* ehsize (elf header size = 0x34) */
@@ -113,16 +113,17 @@ static int dm_test_remoteproc_elf(struct unit_test_state *uts)
 		0x20, 0x00,
 		/* phnum (program header number : 1) */
 		0x01, 0x00,
-		/* shentsize (section heade size : none) */
-		0x00, 0x00,
-		/* shnum (section header number: none) */
-		0x00, 0x00,
-		/* shstrndx (section header name section index: none) */
-		0x00, 0x00,
+		/* shentsize (section header size : 40 bytes) */
+		0x28, 0x00,
+		/* shnum (section header number: 3) */
+		0x02, 0x00,
+		/* shstrndx (section header name section index: 1) */
+		0x01, 0x00,
 		/* padding */
 		0x00, 0x00, 0x00, 0x00,
 		0x00, 0x00, 0x00, 0x00,
 		0x00, 0x00, 0x00, 0x00,
+
 		/* @0x40 - PROGRAM HEADER TABLE - */
 		/* type : PT_LOAD */
 		0x01, 0x00, 0x00, 0x00,
@@ -140,14 +141,63 @@ static int dm_test_remoteproc_elf(struct unit_test_state *uts)
 		0x05, 0x00, 0x00, 0x00,
 		/* padding */
 		0x00, 0x00, 0x00, 0x00,
+
+		/* @0x60 - RESOURCE TABLE SECTION - */
+		/* version */
+		0x01, 0x00, 0x00, 0x00,
+		/* num (0, no entries) */
+		0x00, 0x00, 0x00, 0x00,
+		/* Reserved */
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+
+		/* @0x70 - SECTION'S NAMES SECTION - */
+		/* section 0 name (".shrtrtab") */
+		0x2e, 0x73, 0x68, 0x73, 0x74, 0x72, 0x74, 0x61, 0x62, 0x00,
+		/* section 1 name (".resource_table") */
+		0x2e, 0x72, 0x65, 0x73, 0x6f, 0x75, 0x72, 0x63, 0x65, 0x5f,
+		0x74, 0x61, 0x62, 0x6c, 0x65, 0x00,
+		/* padding */
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+
+		/* @0x90 - SECTION HEADER TABLE - */
+		/* Section 0 : resource table header */
+		/* sh_name - index into section header string table section */
+		0x0a, 0x00, 0x00, 0x00,
+		/* sh_type and sh_flags */
+		0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
+		/* sh_addr = where the resource table has to be copied to */
+		0x00, 0x00, 0x00, 0x00,
+		/* sh_offset = 0x60 */
+		0x60, 0x00, 0x00, 0x00,
+		/* sh_size = 16 bytes */
+		0x10, 0x00, 0x00, 0x00,
+		/* sh_link, sh_info, sh_addralign, sh_entsize */
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* Section 1 : section's names section header */
+		/* sh_name - index into section header string table section */
+		0x00, 0x00, 0x00, 0x00,
+		/* sh_type and sh_flags */
+		0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* sh_addr  */
+		0x00, 0x00, 0x00, 0x00,
+		/* sh_offset = 0x70 */
+		0x70, 0x00, 0x00, 0x00,
+		/* sh_size = 27 bytes */
+		0x1b, 0x00, 0x00, 0x00,
+		/* sh_link, sh_info, sh_addralign, sh_entsize */
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	};
 	unsigned int size = ARRAY_SIZE(valid_elf32);
 	struct udevice *dev;
-	phys_addr_t loaded_firmware_paddr;
-	void *loaded_firmware;
-	u32 loaded_firmware_size;
+	phys_addr_t loaded_firmware_paddr, loaded_rsc_table_paddr;
+	void *loaded_firmware, *loaded_rsc_table;
+	u32 loaded_firmware_size, rsc_table_size;
+	ulong rsc_addr, rsc_size;
 	Elf32_Ehdr *ehdr = (Elf32_Ehdr *)valid_elf32;
 	Elf32_Phdr *phdr = (Elf32_Phdr *)(valid_elf32 + ehdr->e_phoff);
+	Elf32_Shdr *shdr = (Elf32_Shdr *)(valid_elf32 + ehdr->e_shoff);
 
 	ut_assertok(uclass_get_device(UCLASS_REMOTEPROC, 0, &dev));
 
@@ -178,6 +228,25 @@ static int dm_test_remoteproc_elf(struct unit_test_state *uts)
 		    0x08000000);
 	unmap_physmem(loaded_firmware, MAP_NOCACHE);
 
+	/* Resource table */
+	shdr->sh_addr = CONFIG_SYS_SDRAM_BASE;
+	rsc_table_size = shdr->sh_size;
+
+	loaded_rsc_table_paddr = shdr->sh_addr + DEVICE_TO_PHYSICAL_OFFSET;
+	loaded_rsc_table = map_physmem(loaded_rsc_table_paddr,
+				       rsc_table_size, MAP_NOCACHE);
+	ut_assertnonnull(loaded_rsc_table);
+	memset(loaded_rsc_table, 0, rsc_table_size);
+
+	/* Load and verify */
+	ut_assertok(rproc_elf32_load_rsc_table(dev, (ulong)valid_elf32, size,
+					       &rsc_addr, &rsc_size));
+	ut_asserteq(rsc_addr, CONFIG_SYS_SDRAM_BASE);
+	ut_asserteq(rsc_size, rsc_table_size);
+	ut_assertok(memcmp(loaded_firmware, valid_elf32 + shdr->sh_offset,
+			   shdr->sh_size));
+	unmap_physmem(loaded_firmware, MAP_NOCACHE);
+
 	/* Invalid ELF Magic */
 	valid_elf32[0] = 0;
 	ut_asserteq(-EPROTONOSUPPORT,
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
