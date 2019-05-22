Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119125F0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF63C65070
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D906C628C7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M87KA8002965; Wed, 22 May 2019 10:07:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zzoQH+XomhxRgt0HPWSQ2ii8H5oVDzbjC+SU8FSwgwM=;
 b=g/lL/XceLdt3rNN2m0CvKe62DAxznFg31nPz+HHlZ8x2W9P49MzbT+BHz9eHPMHpZCIu
 4llTzWtsZqOT4RLoChf51Y88qs0akH9QMYs9CRiOC+uYgfoLm5DrEvetMkIhPFbHmeat
 Y4TdxOg/rl5F71ixpx6zfbkAvmxR8oNJn3Lm6ZcZI1x070bkCCXYz03s75bdOZ1WscQQ
 EHdvRhtmxQNiCJcT++4SOJ2uOuNRAPBRnYJQQmGS99ZGRMC1o5Tx8CCmY14WlpHNgWlZ
 INsydf/rktNnhoSy5sfR1NLq45oQGjMPwFuPfN3X7rM/9Ga/DnMQWhKd4V+eilRCV4X4 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xgeu6t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E60D46;
 Wed, 22 May 2019 08:07:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60BB418B2;
 Wed, 22 May 2019 08:07:10 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:10 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:09
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:46 +0200
Message-ID: <1558512409-32376-5-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 4/7] remoteproc: add elf file load support
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

The current implementation supports only binary file load.
Add helpers to support ELF format (check validity, sanity check, and
load).
Note that since an ELF image is built for the remote processor, the load
function uses the da_to_pa ops to translate the addresses.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/rproc-uclass.c | 128 ++++++++++++++++++++++++++++++++++++++
 include/remoteproc.h              |  29 ++++++++-
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
index c8a41a6..ac5f9e2 100644
--- a/drivers/remoteproc/rproc-uclass.c
+++ b/drivers/remoteproc/rproc-uclass.c
@@ -5,6 +5,7 @@
  */
 #define pr_fmt(fmt) "%s: " fmt, __func__
 #include <common.h>
+#include <elf.h>
 #include <errno.h>
 #include <fdtdec.h>
 #include <malloc.h>
@@ -291,6 +292,133 @@ int rproc_dev_init(int id)
 	return ret;
 }
 
+/*
+ * Determine if a valid ELF image exists at the given memory location.
+ * First look at the ELF header magic field, then make sure that it is
+ * executable.
+ */
+bool rproc_elf_is_valid(unsigned long addr, int size)
+{
+	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
+
+	ehdr = (Elf32_Ehdr *)addr;
+
+	if (!IS_ELF(*ehdr) || size <= sizeof(Elf32_Ehdr)) {
+		pr_err("No elf image at address 0x%08lx\n", addr);
+		return false;
+	}
+
+	if (ehdr->e_type != ET_EXEC) {
+		pr_err("Not a 32-bit elf image at address 0x%08lx\n", addr);
+		return false;
+	}
+
+	return true;
+}
+
+/* Basic function to verify ELF image format */
+int rproc_elf_sanity_check(ulong addr, ulong size)
+{
+	Elf32_Ehdr *ehdr;
+	char class;
+
+	if (!addr) {
+		pr_err("Invalid fw address?\n");
+		return -EINVAL;
+	}
+
+	if (size < sizeof(Elf32_Ehdr)) {
+		pr_err("Image is too small\n");
+		return -EINVAL;
+	}
+
+	ehdr = (Elf32_Ehdr *)addr;
+
+	/* We only support ELF32 at this point */
+	class = ehdr->e_ident[EI_CLASS];
+	if (class != ELFCLASS32) {
+		pr_err("Unsupported class: %d\n", class);
+		return -EINVAL;
+	}
+
+	/* We assume the firmware has the same endianness as the host */
+# ifdef __LITTLE_ENDIAN
+	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
+# else /* BIG ENDIAN */
+	if (ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
+# endif
+		pr_err("Unsupported firmware endianness\n");
+		return -EINVAL;
+	}
+
+	if (size < ehdr->e_shoff + sizeof(Elf32_Shdr)) {
+		pr_err("Image is too small\n");
+		return -EINVAL;
+	}
+
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
+		pr_err("Image is corrupted (bad magic)\n");
+		return -EINVAL;
+	}
+
+	if (ehdr->e_phnum == 0) {
+		pr_err("No loadable segments\n");
+		return -EINVAL;
+	}
+
+	if (ehdr->e_phoff > size) {
+		pr_err("Firmware size is too small\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* A very simple elf loader, assumes the image is valid */
+int rproc_elf_load_image(struct udevice *dev, unsigned long addr)
+{
+	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
+	Elf32_Phdr *phdr; /* Program header structure pointer */
+	const struct dm_rproc_ops *ops;
+	unsigned int i;
+
+	ehdr = (Elf32_Ehdr *)addr;
+	phdr = (Elf32_Phdr *)(addr + ehdr->e_phoff);
+
+	ops = rproc_get_ops(dev);
+	if (!ops) {
+		dev_dbg(dev, "Driver has no ops?\n");
+		return -EINVAL;
+	}
+
+	/* Load each program header */
+	for (i = 0; i < ehdr->e_phnum; ++i) {
+		void *dst = (void *)(uintptr_t)phdr->p_paddr;
+		void *src = (void *)addr + phdr->p_offset;
+
+		if (phdr->p_type != PT_LOAD)
+			continue;
+
+		if (ops->da_to_pa)
+			dst = (void *)ops->da_to_pa(dev, (ulong)dst);
+
+		dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
+			i, dst, phdr->p_filesz);
+		if (phdr->p_filesz)
+			memcpy(dst, src, phdr->p_filesz);
+		if (phdr->p_filesz != phdr->p_memsz)
+			memset(dst + phdr->p_filesz, 0x00,
+			       phdr->p_memsz - phdr->p_filesz);
+		flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+			    roundup((unsigned long)dst + phdr->p_filesz,
+				    ARCH_DMA_MINALIGN) -
+			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+		++phdr;
+	}
+
+	return 0;
+}
+
 int rproc_load(int id, ulong addr, ulong size)
 {
 	struct udevice *dev = NULL;
diff --git a/include/remoteproc.h b/include/remoteproc.h
index 58df11a..5cc04e6 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -104,7 +104,7 @@ int rproc_dev_init(int id);
 bool rproc_is_initialized(void);
 
 /**
- * rproc_load() - load binary to a remote processor
+ * rproc_load() - load binary or elf to a remote processor
  * @id:		id of the remote processor
  * @addr:	address in memory where the binary image is located
  * @size:	size of the binary image
@@ -159,6 +159,27 @@ int rproc_ping(int id);
  * Return: 0 if all ok, else appropriate error value.
  */
 int rproc_is_running(int id);
+
+/**
+ * rproc_elf_is_valid() - check if an image is a valid ELF one
+ * @addr:	image address
+ * @size:	image size
+ */
+bool rproc_elf_is_valid(unsigned long addr, int size);
+
+/**
+ * rproc_elf_sanity_check() - verify an ELF image format
+ * @addr:	ELF image address
+ * @size:	ELF image size
+ */
+int rproc_elf_sanity_check(ulong addr, ulong size);
+
+/**
+ * rproc_elf_load_image() - load an ELF image
+ * @dev:	device loading the ELF image
+ * @addr:	valid ELF image address
+ */
+int rproc_elf_load_image(struct udevice *dev, unsigned long addr);
 #else
 static inline int rproc_init(void) { return -ENOSYS; }
 static inline int rproc_dev_init(int id) { return -ENOSYS; }
@@ -169,6 +190,12 @@ static inline int rproc_stop(int id) { return -ENOSYS; }
 static inline int rproc_reset(int id) { return -ENOSYS; }
 static inline int rproc_ping(int id) { return -ENOSYS; }
 static inline int rproc_is_running(int id) { return -ENOSYS; }
+static inline bool rproc_elf_is_valid(unsigned long addr,
+				      int size) { return -ENOSYS; }
+static inline int rproc_elf_sanity_check(ulong addr,
+					 ulong size) { return -ENOSYS; }
+static inline int rproc_elf_load_image(struct udevice *dev,
+				       unsigned long addr)  { return -ENOSYS; }
 #endif
 
 #endif	/* _RPROC_H_ */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
