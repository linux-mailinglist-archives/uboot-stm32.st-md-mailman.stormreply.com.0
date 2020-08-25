Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49371251B38
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 16:50:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00189C32EA7
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 14:50:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5745CC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598366983;
 bh=O/kSC+usuEDpPZrHkrhNGsdqUK3/EI0SAcNOo6s42ac=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Z20W4glGbMTCVyFA23y1CoMBolrZmt4mK0Bb0eXynVpWQm+K2wyOeyV0W7YIZcRsB
 EMOQzvI7J8uzE4Hk7fCRxLKJrIvlBtp8sGvWRJ2/SrvXPKo3nzIaUcAYKYPS8KXMvu
 na4LZ2ovHVMPFf3bDcHi/of5MtoW+157T3IsBhyg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.70] ([178.202.41.107]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1kiKgW3htK-016wbw; Tue, 25
 Aug 2020 16:49:42 +0200
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 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 Eg==
Message-ID: <0e961a12-3408-87ca-1d64-0a07bad3a4f0@gmx.de>
Date: Tue, 25 Aug 2020 16:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:I8uqC+K+7fT0BREZwyEblDBGBEPtUuHQXSwkvkNI6bKYrQFpGVs
 WFgJIrCdZpgPW8Etv9wkDZvIt9o1uh/EzsWdiAorDEtV2txUUnrPJ3FnOjSdN7Bbgqj8LhV
 8vEP1vg7H1vFBvOVtK49kjdg01HDFaKSUv8R5UcrNMKETaoKqQYGjrbPjw5GuEUs0UKW6sJ
 NOk1efb32RE1myJxLTDsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xnf8UsOKRQE=:cC7pVbpOYXAiA8EPtlXUBE
 18EleZ2Ugfrl8Jl+akov1FXMgldVqw8HXimJB3pke5iUIIhCIsiSyuxCrrFxQYygj+oSTt1o3
 ee8JqD0wGDXrtB4aW+CnDog1U7lkyE+C/3/W2lexx2pQ5A9ZgNdqfRUGmT8x66Bsdn8/GHzxW
 rcwboaR7+65+zx9xTMumOEUkTeZxF6lyzqbOcXMzrVUA9w0kUGyVlYhq8jnVe1y126iVRTR0S
 D0ZHaR7gaCw1CffdyPcPkhdjrE5zuvSPfEZyykKW9+yIolSp2iIInRa4fQE3Hb6lJsKMAi9FZ
 pHoClFPQYWiFNYjbMK4taiJdQkXpJD5abcfbzJ/A6AlqiXWKBbRZ4K/aJGXFnKpRhf9c4jWSP
 zD0vNZ/URPcFpTMD6yJfxmmQZ4NiwnzhSA8FsCm2l35/v+rtA/r+CAykH1tuGZ07eK/iwVXlT
 PnjS7WGkGcIvpg38zd0QLaMcT+ubCPOQfeuV1IXRPeqLClYp9fWvsr4gGpF6O2HzqaaSxwM+m
 I0q+RE/QvmDiPL1nf80a6A3UWBQZj9QG86XEop8KSr+oF7h326d99MXyr4nOw4zDtyXjikYQH
 G0rgOiiZ1aBVZ2UK5kskEDArju7iKglIRPvz72cfBHmnv6zYYcF9vNDBQWVBWWdId8hXwnnhh
 i8uDjrmLeWw9iVfffkApyA7wgNkxc4UjuQ/pU0d0qXAx12DS5wRhMGh28bYaHXBl6SEKePJ5P
 69+nMO70pI3vab36Ush3uwfTvA+rljvv5wJDOJN7JTWFVi79AQXJKShc4E2bucpDYrtBsxssq
 1Yvj0MBqzPS+AQRWTmcWH8E1ROKUxiruS63iD0B71Le1ff4LNdiN4iHqufalsXiT/yV4+OY6c
 wyv+MLqbDx1nrdCX8ptWtaH6YyqK/X7JSAXTqNhhVmycd/9N6dfB3SR7HQiC5RvyyBwWFjVGy
 INRZrnnDHa8hAGR3fcMmxthEnDvpTOUctJLQ2xjW1Lyvu2yTf3JhMKrBWA29IgeCrWq3xthZ4
 exjRm5UkEicV93f8GessHMbXIzr1Kaswy1F9ZB1rMX345nN/frb0aDLamWDiOlezcnBhct0fe
 mrCoWYSbbl4KPvqn6nrgahEeK5eRWE7R4K3BrEnZQ5ZWp/ae0lG6olS66bVfjcxOpOZpJW7dR
 g+7rerWbQMKJE+cg+pm6SUtPEp35exdKYiPVDe7ejeTfHR0gu8gylVT8Z+duodUg8DexAspyW
 VODoRVVMe+SicsR/HOuTIgGwFDqUckgi41Q9R1w9Mg80UD0Az4I1vwiJdSnsP0ohQhZ2YQLF8
 ODok3EodWIAC499g1u+Gef6wZU68hyZvShYUH5c7bNHMc7FpBJ/e8lwSik+mSos3m81wulDTL
 cGRsEoB8wq/v8S7ErHoOA==
Cc: Etienne Carriere <etienne.carriere@st.com>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Rick Chen <rick@andestech.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Atish Patra <atish.patra@wdc.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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

On 25.08.20 13:42, Patrice Chotard wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Add boolean input argument @no_map to helper function
> fdtdec_add_reserved_memory() to add "no-map" property for an added
> reserved memory node. This is needed for example when the reserved
> memory relates to secure memory that the dear Linux kernel shall
> not even map unless what non-secure world speculative accesses of the

This sentence needs rework. Do you mean "to avoid non-secure world
accesses of the CPU that might reveal the secure-world memory"?

Is there any evidence that mapping memory as reserved can lead to an
information leak and that not mapping solves the problem? Is there a CVE
for it?

> CPU can violate the memory firmware configuration.

Most Linux distributions boot via EFI.

In U-Boot's UEFI sub-system we pass reserved memory as
EFI_RESERVED_MEMORY_TYPE in the memory map to Linux. See function
efi_carve_out_dt_rsv(). We do not consider the no-map attribute in the
device-tree.

Does the Linux kernel care about this no-map attribute in the
device-tree if we are booting via UEFI?

>
> No function change. A later change will update to OPTEE library to
> add no-map property to OP-TEE reserved memory nodes.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
>    - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
>    fdtdec_add_reserved_memory() new parameter
>
>  arch/riscv/lib/fdt_fixup.c |  2 +-
>  include/fdtdec.h           |  5 +++--
>  lib/fdtdec.c               | 10 ++++++++--
>  lib/optee/optee.c          |  2 +-
>  test/dm/fdtdec.c           |  6 +++---
>  5 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/lib/fdt_fixup.c b/arch/riscv/lib/fdt_fixup.c
> index 5b2420243f..d02062fd5b 100644
> --- a/arch/riscv/lib/fdt_fixup.c
> +++ b/arch/riscv/lib/fdt_fixup.c
> @@ -75,7 +75,7 @@ int riscv_fdt_copy_resv_mem_node(const void *src, void *dst)
>  		pmp_mem.start = addr;
>  		pmp_mem.end = addr + size - 1;
>  		err = fdtdec_add_reserved_memory(dst, basename, &pmp_mem,
> -						 &phandle);
> +						 &phandle, false);

I guess in a future patch we would want to set nomap=true here too as
this is the memory reserved by the secure execution environment (e.g.
OpenSBI).

Best regards

Heinrich

>  		if (err < 0 && err != -FDT_ERR_EXISTS) {
>  			log_err("failed to add reserved memory: %d\n", err);
>  			return err;
> diff --git a/include/fdtdec.h b/include/fdtdec.h
> index bc79389260..f127c7d386 100644
> --- a/include/fdtdec.h
> +++ b/include/fdtdec.h
> @@ -1016,7 +1016,7 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
>   *     };
>   *     uint32_t phandle;
>   *
> - *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle);
> + *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle, false);
>   *
>   * This results in the following subnode being added to the top-level
>   * /reserved-memory node:
> @@ -1043,11 +1043,12 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
>   * @param carveout	information about the carveout region
>   * @param phandlep	return location for the phandle of the carveout region
>   *			can be NULL if no phandle should be added
> + * @param no_map	add "no-map" property if true
>   * @return 0 on success or a negative error code on failure
>   */
>  int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  			       const struct fdt_memory *carveout,
> -			       uint32_t *phandlep);
> +			       uint32_t *phandlep, bool no_map);
>
>  /**
>   * fdtdec_get_carveout() - reads a carveout from an FDT
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> index 30a1c6a217..bf40d87cb3 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -1303,7 +1303,7 @@ static int fdtdec_init_reserved_memory(void *blob)
>
>  int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  			       const struct fdt_memory *carveout,
> -			       uint32_t *phandlep)
> +			       uint32_t *phandlep, bool no_map)
>  {
>  	fdt32_t cells[4] = {}, *ptr = cells;
>  	uint32_t upper, lower, phandle;
> @@ -1403,6 +1403,12 @@ int fdtdec_add_reserved_memory(void *blob, const char *basename,
>  	if (err < 0)
>  		return err;
>
> +	if (no_map) {
> +		err = fdt_setprop(blob, node, "no-map", NULL, 0);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	/* return the phandle for the new node for the caller to use */
>  	if (phandlep)
>  		*phandlep = phandle;
> @@ -1468,7 +1474,7 @@ int fdtdec_set_carveout(void *blob, const char *node, const char *prop_name,
>  	fdt32_t value;
>  	void *prop;
>
> -	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle);
> +	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle, false);
>  	if (err < 0) {
>  		debug("failed to add reserved memory: %d\n", err);
>  		return err;
> diff --git a/lib/optee/optee.c b/lib/optee/optee.c
> index 457d4cca8a..963c2ff430 100644
> --- a/lib/optee/optee.c
> +++ b/lib/optee/optee.c
> @@ -192,7 +192,7 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
>  				ret = fdtdec_add_reserved_memory(new_blob,
>  								 nodename,
>  								 &carveout,
> -								 NULL);
> +								 NULL, false);
>  				free(oldname);
>
>  				if (ret < 0)
> diff --git a/test/dm/fdtdec.c b/test/dm/fdtdec.c
> index 716993f706..4119003041 100644
> --- a/test/dm/fdtdec.c
> +++ b/test/dm/fdtdec.c
> @@ -80,7 +80,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x1000;
>  	resv.end = 0x1fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region",
> -					       &resv, &phandle));
> +					       &resv, &phandle, false));
>
>  	/* Test /reserve-memory and its subnode should exist */
>  	parent = fdt_path_offset(blob, "/reserved-memory");
> @@ -101,7 +101,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x2000;
>  	resv.end = 0x2fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region1",
> -					       &resv, &phandle1));
> +					       &resv, &phandle1, false));
>  	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region1");
>  	ut_assert(subnode > 0);
>
> @@ -115,7 +115,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
>  	resv.start = 0x1000;
>  	resv.end = 0x1fff;
>  	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region2",
> -					       &resv, &phandle1));
> +					       &resv, &phandle1, false));
>  	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region2");
>  	ut_assert(subnode < 0);
>
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
