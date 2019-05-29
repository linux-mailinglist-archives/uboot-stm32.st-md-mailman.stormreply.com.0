Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A32E110
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 May 2019 17:29:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0714C35E01
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 May 2019 15:29:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D77DC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 15:29:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TFLgTD012609; Wed, 29 May 2019 17:29:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5RzGIY07PGAgv/4liD+vPnhru1h2O2pQdHdTq6U+obE=;
 b=heEqsM7z/qU5DFk895/uNn3AUsCs7Ie0W5ieGooZ/RmhCOiVbgFe6af1ynCXikLgBwPu
 Qypi6fQ6OfvQ3E/8jkiHqyoSMONJQcMA/lztmdYQq1L7+TNnkRVO9hU/fDe3yLF8XLm+
 XpllbpgqOTreE74OLthseWPB2itsWTxMz92heEmhwxvWv4JQt5C7xPRDUOcOxGymP9Ii
 fv2PT496lqnupydj3nXNaNFf9d8zefkPhxS6n1BXwp51snioWKgTcJRTnfBNUmIABfXg
 up4LcDi7tO+CiofFIp7jayqg2dm/62mSmPgbsx86bVVC7saQDFiyV/VfeQUTAMzY259i NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spufu0ej5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 29 May 2019 17:29:25 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91DE834;
 Wed, 29 May 2019 15:29:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 594EE4E53;
 Wed, 29 May 2019 15:29:23 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 May
 2019 17:29:23 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Wed, 29 May 2019 17:29:23 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 "Patrick DELAUNAY" <patrick.delaunay@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v2 4/7] remoteproc: add elf file load support
Thread-Index: AQHVFIb7NL/jIPFyv0SFaQFFwUOjnaaBYYIAgAC6fIA=
Date: Wed, 29 May 2019 15:29:22 +0000
Message-ID: <ef640c4d-1dbc-8a86-4901-e046fd8f9495@st.com>
References: <1558959797-15299-1-git-send-email-fabien.dessenne@st.com>
 <1558959797-15299-5-git-send-email-fabien.dessenne@st.com>
 <e76e9fbf-9167-1a41-7cc1-45978b8f13c0@ti.com>
In-Reply-To: <e76e9fbf-9167-1a41-7cc1-45978b8f13c0@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <85344A1A5154144B816EE515F004BFF9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_07:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/7] remoteproc: add elf file load
	support
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

Hi Lokesh


On 29/05/2019 6:21 AM, Lokesh Vutla wrote:
>
> On 27/05/19 5:53 PM, Fabien Dessenne wrote:
>> The current implementation supports only binary file load.
>> Add helpers to support ELF format (sanity check, and load).
>> Note that since an ELF image is built for the remote processor, the load
>> function uses the device_to_virt ops to translate the addresses.
>> Implement a basic translation for sandbox_testproc.
>>
>> Add related tests. Test result:
>> => ut dm remoteproc_elf
>> Test: dm_test_remoteproc_elf: remoteproc.c
>> Test: dm_test_remoteproc_elf: remoteproc.c (flat tree)
>> Failures: 0
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Can you create a new file(rproc-elf-loader.c) or something similar for elf
> loading support.


It sounds good, I'll do that.


>   Ill be sending 64bit elf loading support soon. Instead of
> cluttering rproc-uclass, it is better to separate out elf loading support.


Since you plan support for elf64, I may consider renaming the elf 
functions in elf32. I'll check this too.

BR

Fabien


>
> Thanks and regards,
> Lokesh
>
>> ---
>>   drivers/remoteproc/rproc-uclass.c     |  99 +++++++++++++++++++++++++++
>>   drivers/remoteproc/sandbox_testproc.c |  19 ++++++
>>   include/remoteproc.h                  |  30 ++++++++-
>>   test/dm/remoteproc.c                  | 122 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 267 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
>> index c8a41a6..4d85732 100644
>> --- a/drivers/remoteproc/rproc-uclass.c
>> +++ b/drivers/remoteproc/rproc-uclass.c
>> @@ -5,6 +5,7 @@
>>    */
>>   #define pr_fmt(fmt) "%s: " fmt, __func__
>>   #include <common.h>
>> +#include <elf.h>
>>   #include <errno.h>
>>   #include <fdtdec.h>
>>   #include <malloc.h>
>> @@ -291,6 +292,104 @@ int rproc_dev_init(int id)
>>   	return ret;
>>   }
>>   
>> +/* Basic function to verify ELF image format */
>> +int rproc_elf_sanity_check(ulong addr, ulong size)
>> +{
>> +	Elf32_Ehdr *ehdr;
>> +	char class;
>> +
>> +	if (!addr) {
>> +		pr_debug("Invalid fw address?\n");
>> +		return -EFAULT;
>> +	}
>> +
>> +	if (size < sizeof(Elf32_Ehdr)) {
>> +		pr_debug("Image is too small\n");
>> +		return -ENOSPC;
>> +	}
>> +
>> +	ehdr = (Elf32_Ehdr *)addr;
>> +	class = ehdr->e_ident[EI_CLASS];
>> +
>> +	if (!IS_ELF(*ehdr) || ehdr->e_type != ET_EXEC || class != ELFCLASS32) {
>> +		pr_debug("Not an executable ELF32 image\n");
>> +		return -EPROTONOSUPPORT;
>> +	}
>> +
>> +	/* We assume the firmware has the same endianness as the host */
>> +# ifdef __LITTLE_ENDIAN
>> +	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
>> +# else /* BIG ENDIAN */
>> +	if (ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
>> +# endif
>> +		pr_debug("Unsupported firmware endianness\n");
>> +		return -EILSEQ;
>> +	}
>> +
>> +	if (size < ehdr->e_shoff + sizeof(Elf32_Shdr)) {
>> +		pr_debug("Image is too small\n");
>> +		return -ENOSPC;
>> +	}
>> +
>> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
>> +		pr_debug("Image is corrupted (bad magic)\n");
>> +		return -EBADF;
>> +	}
>> +
>> +	if (ehdr->e_phnum == 0) {
>> +		pr_debug("No loadable segments\n");
>> +		return -ENOEXEC;
>> +	}
>> +
>> +	if (ehdr->e_phoff > size) {
>> +		pr_debug("Firmware size is too small\n");
>> +		return -ENOSPC;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* A very simple elf loader, assumes the image is valid */
>> +int rproc_elf_load_image(struct udevice *dev, unsigned long addr)
>> +{
>> +	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
>> +	Elf32_Phdr *phdr; /* Program header structure pointer */
>> +	const struct dm_rproc_ops *ops;
>> +	unsigned int i;
>> +
>> +	ehdr = (Elf32_Ehdr *)addr;
>> +	phdr = (Elf32_Phdr *)(addr + ehdr->e_phoff);
>> +
>> +	ops = rproc_get_ops(dev);
>> +
>> +	/* Load each program header */
>> +	for (i = 0; i < ehdr->e_phnum; ++i) {
>> +		void *dst = (void *)(uintptr_t)phdr->p_paddr;
>> +		void *src = (void *)addr + phdr->p_offset;
>> +
>> +		if (phdr->p_type != PT_LOAD)
>> +			continue;
>> +
>> +		if (ops->device_to_virt)
>> +			dst = ops->device_to_virt(dev, (ulong)dst);
>> +
>> +		dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
>> +			i, dst, phdr->p_filesz);
>> +		if (phdr->p_filesz)
>> +			memcpy(dst, src, phdr->p_filesz);
>> +		if (phdr->p_filesz != phdr->p_memsz)
>> +			memset(dst + phdr->p_filesz, 0x00,
>> +			       phdr->p_memsz - phdr->p_filesz);
>> +		flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
>> +			    roundup((unsigned long)dst + phdr->p_filesz,
>> +				    ARCH_DMA_MINALIGN) -
>> +			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
>> +		++phdr;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int rproc_load(int id, ulong addr, ulong size)
>>   {
>>   	struct udevice *dev = NULL;
>> diff --git a/drivers/remoteproc/sandbox_testproc.c b/drivers/remoteproc/sandbox_testproc.c
>> index 51a67e6..5f35119 100644
>> --- a/drivers/remoteproc/sandbox_testproc.c
>> +++ b/drivers/remoteproc/sandbox_testproc.c
>> @@ -8,6 +8,7 @@
>>   #include <dm.h>
>>   #include <errno.h>
>>   #include <remoteproc.h>
>> +#include <asm/io.h>
>>   
>>   /**
>>    * enum sandbox_state - different device states
>> @@ -300,6 +301,23 @@ static int sandbox_testproc_ping(struct udevice *dev)
>>   	return ret;
>>   }
>>   
>> +#define SANDBOX_RPROC_DEV_TO_PHY_OFFSET	0x1000
>> +/**
>> + * sandbox_testproc_device_to_virt() - Convert device address to virtual address
>> + * @dev:	device to operate upon
>> + * @da:		device address
>> + * @return converted virtual address
>> + */
>> +static void *sandbox_testproc_device_to_virt(struct udevice *dev, ulong da)
>> +{
>> +	u64 paddr;
>> +
>> +	/* Use a simple offset conversion */
>> +	paddr = da + SANDBOX_RPROC_DEV_TO_PHY_OFFSET;
>> +
>> +	return phys_to_virt(paddr);
>> +}
>> +
>>   static const struct dm_rproc_ops sandbox_testproc_ops = {
>>   	.init = sandbox_testproc_init,
>>   	.reset = sandbox_testproc_reset,
>> @@ -308,6 +326,7 @@ static const struct dm_rproc_ops sandbox_testproc_ops = {
>>   	.stop = sandbox_testproc_stop,
>>   	.is_running = sandbox_testproc_is_running,
>>   	.ping = sandbox_testproc_ping,
>> +	.device_to_virt = sandbox_testproc_device_to_virt,
>>   };
>>   
>>   static const struct udevice_id sandbox_ids[] = {
>> diff --git a/include/remoteproc.h b/include/remoteproc.h
>> index aef6ff2..f74ccc2 100644
>> --- a/include/remoteproc.h
>> +++ b/include/remoteproc.h
>> @@ -151,10 +151,10 @@ int rproc_dev_init(int id);
>>   bool rproc_is_initialized(void);
>>   
>>   /**
>> - * rproc_load() - load binary to a remote processor
>> + * rproc_load() - load binary or elf to a remote processor
>>    * @id:		id of the remote processor
>> - * @addr:	address in memory where the binary image is located
>> - * @size:	size of the binary image
>> + * @addr:	address in memory where the image is located
>> + * @size:	size of the image
>>    * @return 0 if all ok, else appropriate error value.
>>    */
>>   int rproc_load(int id, ulong addr, ulong size);
>> @@ -200,6 +200,26 @@ int rproc_ping(int id);
>>    * processor, but just ensures that it is out of reset and executing code.
>>    */
>>   int rproc_is_running(int id);
>> +
>> +/**
>> + * rproc_elf_sanity_check() - Verify if an image is a valid ELF one
>> + *
>> + * Check if a valid ELF image exists at the given memory location. Verify
>> + * basic ELF format requirements like magic number and sections size.
>> + *
>> + * @addr:	address of the image to verify
>> + * @size:	size of the image
>> + * @return 0 if the image looks good, else appropriate error value.
>> + */
>> +int rproc_elf_sanity_check(ulong addr, ulong size);
>> +
>> +/**
>> + * rproc_elf_load_image() - load an ELF image
>> + * @dev:	device loading the ELF image
>> + * @addr:	valid ELF image address
>> + * @return 0 if the image is successfully loaded, else appropriate error value.
>> + */
>> +int rproc_elf_load_image(struct udevice *dev, unsigned long addr);
>>   #else
>>   static inline int rproc_init(void) { return -ENOSYS; }
>>   static inline int rproc_dev_init(int id) { return -ENOSYS; }
>> @@ -210,6 +230,10 @@ static inline int rproc_stop(int id) { return -ENOSYS; }
>>   static inline int rproc_reset(int id) { return -ENOSYS; }
>>   static inline int rproc_ping(int id) { return -ENOSYS; }
>>   static inline int rproc_is_running(int id) { return -ENOSYS; }
>> +static inline int rproc_elf_sanity_check(ulong addr,
>> +					 ulong size) { return -ENOSYS; }
>> +static inline int rproc_elf_load_image(struct udevice *dev,
>> +				       unsigned long addr)  { return -ENOSYS; }
>>   #endif
>>   
>>   #endif	/* _RPROC_H_ */
>> diff --git a/test/dm/remoteproc.c b/test/dm/remoteproc.c
>> index 3975c67..8d444fc 100644
>> --- a/test/dm/remoteproc.c
>> +++ b/test/dm/remoteproc.c
>> @@ -5,8 +5,10 @@
>>    */
>>   #include <common.h>
>>   #include <dm.h>
>> +#include <elf.h>
>>   #include <errno.h>
>>   #include <remoteproc.h>
>> +#include <asm/io.h>
>>   #include <dm/test.h>
>>   #include <test/ut.h>
>>   /**
>> @@ -65,3 +67,123 @@ static int dm_test_remoteproc_base(struct unit_test_state *uts)
>>   	return 0;
>>   }
>>   DM_TEST(dm_test_remoteproc_base, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
>> +
>> +#define DEVICE_TO_PHYSICAL_OFFSET	0x1000
>> +/**
>> + * dm_test_remoteproc_elf() - test the ELF operations
>> + * @uts:	unit test state
>> + *
>> + * Return:	0 if test passed, else error
>> + */
>> +static int dm_test_remoteproc_elf(struct unit_test_state *uts)
>> +{
>> +	u8 valid_elf32[] = {
>> +		/* @0x00 - ELF HEADER - */
>> +		/* ELF magic */
>> +		0x7f, 0x45, 0x4c, 0x46,
>> +		/* 32 Bits */
>> +		0x01,
>> +		/* Endianness */
>> +#ifdef __LITTLE_ENDIAN
>> +		0x01,
>> +#else
>> +		0x02,
>> +#endif
>> +		/* Version */
>> +		0x01,
>> +		/* Padding */
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +		/* Type : executable */
>> +		0x02, 0x00,
>> +		/* Machine: ARM */
>> +		0x28, 0x00,
>> +		/* Version */
>> +		0x01, 0x00, 0x00, 0x00,
>> +		/* Entry */
>> +		0x00, 0x00, 0x00, 0x08,
>> +		/* phoff (program header offset @ 0x40)*/
>> +		0x40, 0x00, 0x00, 0x00,
>> +		/* shoff (section header offset : none) */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* flags */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* ehsize (elf header size = 0x34) */
>> +		0x34, 0x00,
>> +		/* phentsize (program header size = 0x20) */
>> +		0x20, 0x00,
>> +		/* phnum (program header number : 1) */
>> +		0x01, 0x00,
>> +		/* shentsize (section heade size : none) */
>> +		0x00, 0x00,
>> +		/* shnum (section header number: none) */
>> +		0x00, 0x00,
>> +		/* shstrndx (section header name section index: none) */
>> +		0x00, 0x00,
>> +		/* padding */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		0x00, 0x00, 0x00, 0x00,
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* @0x40 - PROGRAM HEADER TABLE - */
>> +		/* type : PT_LOAD */
>> +		0x01, 0x00, 0x00, 0x00,
>> +		/* offset */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* vaddr */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* paddr : physical address */
>> +		0x00, 0x00, 0x00, 0x00,
>> +		/* filesz : 0x20 bytes (program header size) */
>> +		0x20, 0x00, 0x00, 0x00,
>> +		/* memsz = filesz */
>> +		0x20, 0x00, 0x00, 0x00,
>> +		/* flags : readable and exectuable */
>> +		0x05, 0x00, 0x00, 0x00,
>> +		/* padding */
>> +		0x00, 0x00, 0x00, 0x00,
>> +	};
>> +	unsigned int size = ARRAY_SIZE(valid_elf32);
>> +	struct udevice *dev;
>> +	phys_addr_t loaded_firmware_paddr;
>> +	void *loaded_firmware;
>> +	u32 loaded_firmware_size;
>> +	Elf32_Ehdr *ehdr = (Elf32_Ehdr *)valid_elf32;
>> +	Elf32_Phdr *phdr = (Elf32_Phdr *)(valid_elf32 + ehdr->e_phoff);
>> +
>> +	ut_assertok(uclass_get_device(UCLASS_REMOTEPROC, 0, &dev));
>> +
>> +	/*
>> +	 * In its Program Header Table, let the firmware specifies to be loaded
>> +	 * at SDRAM_BASE *device* address (p_paddr field).
>> +	 * Its size is defined by the p_filesz field.
>> +	 */
>> +	phdr->p_paddr = CONFIG_SYS_SDRAM_BASE;
>> +	loaded_firmware_size = phdr->p_filesz;
>> +
>> +	/*
>> +	 * This *device* address is converted to a *physical* address by the
>> +	 * device_to_virt() operation of sandbox_test_rproc which returns
>> +	 * DeviceAddress + DEVICE_TO_PHYSICAL_OFFSET.
>> +	 * This is where we expect to get the firmware loaded.
>> +	 */
>> +	loaded_firmware_paddr = phdr->p_paddr + DEVICE_TO_PHYSICAL_OFFSET;
>> +	loaded_firmware = map_physmem(loaded_firmware_paddr,
>> +				      loaded_firmware_size, MAP_NOCACHE);
>> +	ut_assertnonnull(loaded_firmware);
>> +	memset(loaded_firmware, 0, loaded_firmware_size);
>> +
>> +	/* Verify valid ELF format */
>> +	ut_assertok(rproc_elf_sanity_check((ulong)valid_elf32, size));
>> +
>> +	/* Load firmware in loaded_firmware, and verify it */
>> +	ut_assertok(rproc_elf_load_image(dev, (unsigned long)valid_elf32));
>> +	ut_assertok(memcmp(loaded_firmware, valid_elf32, loaded_firmware_size));
>> +	unmap_physmem(loaded_firmware, MAP_NOCACHE);
>> +
>> +	/* Invalid ELF Magic */
>> +	valid_elf32[0] = 0;
>> +	ut_asserteq(-EPROTONOSUPPORT,
>> +		    rproc_elf_sanity_check((ulong)valid_elf32, size));
>> +
>> +	return 0;
>> +}
>> +DM_TEST(dm_test_remoteproc_elf, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
