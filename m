Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A730E327FB
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 07:32:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5683AC98F72
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 05:32:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D14EC98F71
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 05:32:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x535W5DN091820;
 Mon, 3 Jun 2019 00:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559539925;
 bh=kJZS8lcD1vCX6sdq90dQPhs3VEltL0JUPupcvPepr3w=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LVMiNWZu13boggKglzKjVmBJMGl/2cD+ebOmcj1QJVi+FJoslL2YYN6Vx4D+nZUY8
 DQHf8xkjAz410qk8XlpgeHg7TNj+fhI/qhs7xu/FUHs8ET+WAtYQbB970iW/Ys1VZz
 pNcom2hA2MMwToy3arxEiVvk3CotxXhkknido7TU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x535W4oE016383
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2019 00:32:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 3 Jun
 2019 00:32:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 3 Jun 2019 00:32:04 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x535VxQ7067604;
 Mon, 3 Jun 2019 00:32:01 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-5-git-send-email-fabien.dessenne@st.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <fe7fd724-0c9e-bbf1-5542-608ffc467fa1@ti.com>
Date: Mon, 3 Jun 2019 11:01:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1559308296-17027-5-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] remoteproc: add elf file load
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



On 31/05/19 6:41 PM, Fabien Dessenne wrote:
> The current implementation supports only binary file load.
> Add helpers to support ELF32 format (sanity check, and load).
> Note that since an ELF32 image is built for the remote processor, the
> load function uses the device_to_virt ops to translate the addresses.
> Implement a basic translation for sandbox_testproc.
> 
> Add related tests. Test result:
> => ut dm remoteproc_elf
> Test: dm_test_remoteproc_elf: remoteproc.c
> Test: dm_test_remoteproc_elf: remoteproc.c (flat tree)
> Failures: 0
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---

[...snip...]

> +/* Basic function to verify ELF32 image format */
> +int rproc_elf32_sanity_check(ulong addr, ulong size)
> +{
> +	Elf32_Ehdr *ehdr;
> +	char class;
> +
> +	if (!addr) {
> +		pr_debug("Invalid fw address?\n");
> +		return -EFAULT;
> +	}
> +
> +	if (size < sizeof(Elf32_Ehdr)) {
> +		pr_debug("Image is too small\n");
> +		return -ENOSPC;
> +	}
> +
> +	ehdr = (Elf32_Ehdr *)addr;
> +	class = ehdr->e_ident[EI_CLASS];
> +
> +	if (!IS_ELF(*ehdr) || ehdr->e_type != ET_EXEC || class != ELFCLASS32) {
> +		pr_debug("Not an executable ELF32 image\n");
> +		return -EPROTONOSUPPORT;
> +	}
> +
> +	/* We assume the firmware has the same endianness as the host */
> +# ifdef __LITTLE_ENDIAN
> +	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
> +# else /* BIG ENDIAN */
> +	if (ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
> +# endif
> +		pr_debug("Unsupported firmware endianness\n");
> +		return -EILSEQ;
> +	}
> +
> +	if (size < ehdr->e_shoff + sizeof(Elf32_Shdr)) {
> +		pr_debug("Image is too small\n");
> +		return -ENOSPC;
> +	}
> +
> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> +		pr_debug("Image is corrupted (bad magic)\n");
> +		return -EBADF;
> +	}
> +
> +	if (ehdr->e_phnum == 0) {
> +		pr_debug("No loadable segments\n");
> +		return -ENOEXEC;
> +	}
> +
> +	if (ehdr->e_phoff > size) {
> +		pr_debug("Firmware size is too small\n");
> +		return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +/* A very simple elf loader, assumes the image is valid */
> +int rproc_elf32_load_image(struct udevice *dev, unsigned long addr)
> +{
> +	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
> +	Elf32_Phdr *phdr; /* Program header structure pointer */
> +	const struct dm_rproc_ops *ops;
> +	unsigned int i;
> +

I would prefer to call  rproc_elf32_sanity_check() here and reduce the burden on
user. It's my preference and no strong objections.

Other than that:

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
