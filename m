Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4B6F9D9
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 08:58:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99B65CC0815
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 06:58:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB4ACC0813
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 06:58:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6M6ueiq009265; Mon, 22 Jul 2019 08:58:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fcwiKWsYXWtI827spgTYcYDn/VmLK2LpVxI493+an0E=;
 b=Cy1tIcyUjSWk1gMtEE7JveNXhY4Toxo/zhJVbp9EhFJ40RXwc6gJ3ej67aq5dPlBOzOQ
 mptgX7dJWEAcKS5oxD63EdwjX0jhTcGK0lEifYQnR/K9Qzy7HzzWYeO/2aw5iGLLENO1
 srYmq5qLDlkBkaXKYOQw79tUUGPYC0vqDfrRG3t8yBZPx5reHSP0bcInzGAQ4E7gvOnB
 C4vHkbmQCrlY620ZCPlKQDdvu4RXMWzcJVMGNSZlLM3WYi3Ux1fc22Z4Pf9iLiQgZEkt
 psiDq9DVXxS7pAw402NWEYtJeO+QkSI0HsO50VmzKosOjxYXD4e9yiTEIsQJOWpfJy7O eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tusuj1rka-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 08:58:44 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20F6C38;
 Mon, 22 Jul 2019 06:58:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE517131B;
 Mon, 22 Jul 2019 06:58:42 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 08:58:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 08:58:42 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lokesh Vutla <lokeshvutla@ti.com>, Fabien DESSENNE
 <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 4/7] remoteproc: add elf file load support
Thread-Index: AQHVF7JnKg0acaG8WUuHpDKfZvfwoaaJSkKAgE0458A=
Date: Mon, 22 Jul 2019 06:58:42 +0000
Message-ID: <0867eb94c0c549e6822ac9dbf310c54b@SFHDAG6NODE3.st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-5-git-send-email-fabien.dessenne@st.com>
 <fe7fd724-0c9e-bbf1-5542-608ffc467fa1@ti.com>
In-Reply-To: <fe7fd724-0c9e-bbf1-5542-608ffc467fa1@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_05:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
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

Hi Lokesh,

Thanks for the review.
Fabien is in vacation and I will integrate this serie in my next stm32 pull request.

> From: Lokesh Vutla <lokeshvutla@ti.com>
> Sent: lundi 3 juin 2019 07:31
> 
> 
> 
> On 31/05/19 6:41 PM, Fabien Dessenne wrote:
> > The current implementation supports only binary file load.
> > Add helpers to support ELF32 format (sanity check, and load).
> > Note that since an ELF32 image is built for the remote processor, the
> > load function uses the device_to_virt ops to translate the addresses.
> > Implement a basic translation for sandbox_testproc.
> >
> > Add related tests. Test result:
> > => ut dm remoteproc_elf
> > Test: dm_test_remoteproc_elf: remoteproc.c
> > Test: dm_test_remoteproc_elf: remoteproc.c (flat tree)
> > Failures: 0
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> > ---
> 
> [...snip...]
> 
> > +/* Basic function to verify ELF32 image format */ int
> > +rproc_elf32_sanity_check(ulong addr, ulong size) {
> > +	Elf32_Ehdr *ehdr;
> > +	char class;
> > +
> > +	if (!addr) {
> > +		pr_debug("Invalid fw address?\n");
> > +		return -EFAULT;
> > +	}
> > +
> > +	if (size < sizeof(Elf32_Ehdr)) {
> > +		pr_debug("Image is too small\n");
> > +		return -ENOSPC;
> > +	}
> > +
> > +	ehdr = (Elf32_Ehdr *)addr;
> > +	class = ehdr->e_ident[EI_CLASS];
> > +
> > +	if (!IS_ELF(*ehdr) || ehdr->e_type != ET_EXEC || class != ELFCLASS32) {
> > +		pr_debug("Not an executable ELF32 image\n");
> > +		return -EPROTONOSUPPORT;
> > +	}
> > +
> > +	/* We assume the firmware has the same endianness as the host */ #
> > +ifdef __LITTLE_ENDIAN
> > +	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) { # else /* BIG ENDIAN */
> > +	if (ehdr->e_ident[EI_DATA] != ELFDATA2MSB) { # endif
> > +		pr_debug("Unsupported firmware endianness\n");
> > +		return -EILSEQ;
> > +	}
> > +
> > +	if (size < ehdr->e_shoff + sizeof(Elf32_Shdr)) {
> > +		pr_debug("Image is too small\n");
> > +		return -ENOSPC;
> > +	}
> > +
> > +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> > +		pr_debug("Image is corrupted (bad magic)\n");
> > +		return -EBADF;
> > +	}
> > +
> > +	if (ehdr->e_phnum == 0) {
> > +		pr_debug("No loadable segments\n");
> > +		return -ENOEXEC;
> > +	}
> > +
> > +	if (ehdr->e_phoff > size) {
> > +		pr_debug("Firmware size is too small\n");
> > +		return -ENOSPC;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* A very simple elf loader, assumes the image is valid */ int
> > +rproc_elf32_load_image(struct udevice *dev, unsigned long addr) {
> > +	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
> > +	Elf32_Phdr *phdr; /* Program header structure pointer */
> > +	const struct dm_rproc_ops *ops;
> > +	unsigned int i;
> > +
> 
> I would prefer to call  rproc_elf32_sanity_check() here and reduce the burden on
> user. It's my preference and no strong objections.

Yes it is a possibility, but for my side I prefer the Fabien proposition.
(we can perhaps reuse the check of ELF for other use case).

I will merge the patch with this version (to have the patch in v2019.10) .
But I let Fabien conclude and potentially sent a minor update.

> Other than that:
> 
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Thanks and regards,
> Lokesh

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
