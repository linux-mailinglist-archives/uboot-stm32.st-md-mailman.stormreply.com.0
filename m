Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624961127C
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 15:15:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78D8C640F9;
	Fri, 28 Oct 2022 13:15:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C85CDC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:15:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so3197273wmq.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hNUfmJl+0sTiUOzqIEc0UDoY2ojJqdKVKKuDZXACX3c=;
 b=tdHnpSEuqwGbTPKKHD2fh7Dx/yj8ijCq3PrUOofI0pSjDY0X1oircqLFkiFqJbWsM/
 Mj8RMH14PeiqhGYXRvBKDYVMTBN7H3+024oSSKjqtH+2S+sE+IlmpjDYIB+nsIaQmSzA
 nU2r/B2OMtIhsMM699zNqxmXUD8ODqRvkU6EXb5xItaibGARaUQwIZvEO6taXj+IDTcj
 whK8NPlKsZ/EfLzrRZCS/FdUTBz4WpR0KiNyhddhBGPK7IFW3Oo4PS+LApHa+nZXxwTj
 b7sJzTlZmTlgNUnCsVEfeCD1/uLpHVqTkmyBN1SvfENLuxGIgrygdTgEBy9AVUJ82hXq
 RXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNUfmJl+0sTiUOzqIEc0UDoY2ojJqdKVKKuDZXACX3c=;
 b=e4vjiMvyfBU3aOapN38GTeDfFUkzrrWcoFT5KJ9D9zsgLoCFAS20cj/SIAVvdLxbRT
 V0dlZB9uGkoiqPoPu7eeRyoqO42/PEwSgKYSNy5MClM28vrtLa8JvSGU7GJNr7yUzWOJ
 DR5FukRNEKrhIQt33M/2tmuCUJZvvU8hrxREEdGIkK8gb56v7oz6w79GxziUgDyTd55R
 1T81LwP3RB21wzCq9mkz+tzEOYa7fMC4nMZD+eJcclWNsWCvo93e2Mjaxsi/WHwybmH4
 +hlD0oArdNOWS4etJA3iLp/3Kppxjx3rRyc68c5IbhILDaOxZ3jtYEwjis9Ll45FoK7V
 dgeg==
X-Gm-Message-State: ACrzQf3TBlrLixHa0A5rzxNLMltg1NGMJr5KVPOei6ydCQr3ldQ58B4j
 aO+WcwvzCgy4wDilOVRn0glQAg==
X-Google-Smtp-Source: AMsMyM44dQx8YWmNgNQr4LWMhtm360DARjOfsdLtDl9NgPib6LNdnY/E0UaHw/2TBGrGpxKBg1suqA==
X-Received: by 2002:adf:9d88:0:b0:236:57e2:c90 with SMTP id
 p8-20020adf9d88000000b0023657e20c90mr23549888wre.712.1666948509341; 
 Fri, 28 Oct 2022 02:15:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:9e9c:c6c2:95a3:c182?
 ([2a01:e0a:898:f380:9e9c:c6c2:95a3:c182])
 by smtp.gmail.com with ESMTPSA id
 bo12-20020a056000068c00b0023691d62cffsm3544954wrb.70.2022.10.28.02.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:15:09 -0700 (PDT)
Message-ID: <5747d291-0ab8-9318-6d28-bc761ecf2445@linaro.org>
Date: Fri, 28 Oct 2022 11:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.2.I4662774cdd525de1992f84f0ea97255e2e43d8c2@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20221028110055.2.I4662774cdd525de1992f84f0ea97255e2e43d8c2@changeid>
X-Mailman-Approved-At: Fri, 28 Oct 2022 13:15:02 +0000
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick,

On 28/10/2022 11:01, Patrick Delaunay wrote:
> Since the commit d5ba6188dfbf ("cmd: pxe_utils: Check fdtcontroladdr
> in label_boot") the FDT or the FDTDIR label is required in extlinux.conf
> and the fallback done by bootm command when only the device tree present
> in this command parameters is no more performed when FIT is used for
> kernel.
> 
> When the label FDT or FDTDIR are absent or if the device tree file is
> absent, the PXE command in U-Boot uses the default U-Boot device tree
> selected by fdtcontroladdr = gd->fdt_blob, it is the "Scenario 3".
> 
> With this scenario the bootm FIP fallback is no more possible with
> the extlinux.conf when only "kernel" label is present and is a FIP:
> 
>    kernel <path>#<conf>[#<extra-conf[#...]]
> 
> As the U-Boot FDT is always provided in the third bootm argument,
> the device tree found in FIP is not used as fallback, it was done
> previously in boot_get_fdt().
> 
> This patch adds a new field kernel_label to save the full kernel label.
> The FDT bootm parameters use the kernel address (to avoid to load a
> second time the same FIP) and the config when this full label is reused
> for "fdt" or "initrd" label.
> 
> This FIP support in extlinux.conf is restored when the "FDT" label
> can be found and select the same FIP (identical file and configuration):
> 
>    kernel <path>#<conf>[#<extra-conf[#...]]
>    fdt <path>#<conf>[#<extra-conf[#...]]
> 
> The patch add also this possibility for initrd.
> 
>    initrd <path>#<conf>[#<extra-conf[#...]]


Thanks for providing this solution, indeed it solves the original
issue and permits specifying different DT and INITRD configs which
is neat.

I haven't tested it yet, but so far:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   boot/pxe_utils.c    | 17 ++++++++++++++---
>   doc/README.pxe      |  8 ++++++++
>   include/pxe_utils.h |  2 ++
>   3 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
> index 844ab72252bf..756b201eda91 100644
> --- a/boot/pxe_utils.c
> +++ b/boot/pxe_utils.c
> @@ -259,6 +259,7 @@ static struct pxe_label *label_create(void)
>   static void label_destroy(struct pxe_label *label)
>   {
>   	free(label->name);
> +	free(label->kernel_label);
>   	free(label->kernel);
>   	free(label->config);
>   	free(label->append);
> @@ -543,9 +544,11 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   		kernel_addr = fit_addr;
>   	}
>   
> -	if (label->initrd) {
> +	/* For FIT, the label can be identical to kernel one */
> +	if (label->initrd && !strcmp(label->kernel_label, label->initrd)) {
> +		initrd_addr_str =  kernel_addr;
> +	} else if (label->initrd) {
>   		ulong size;
> -
>   		if (get_relfile_envaddr(ctx, label->initrd, "ramdisk_addr_r",
>   					&size) < 0) {
>   			printf("Skipping %s for failure retrieving initrd\n",
> @@ -623,8 +626,11 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   	 */
>   	bootm_argv[3] = env_get("fdt_addr_r");
>   
> +	/* For FIT, the label can be identical to kernel one */
> +	if (label->fdt && !strcmp(label->kernel_label, label->fdt)) {
> +		bootm_argv[3] = kernel_addr;
>   	/* if fdt label is defined then get fdt from server */
> -	if (bootm_argv[3]) {
> +	} else if (bootm_argv[3]) {
>   		char *fdtfile = NULL;
>   		char *fdtfilefree = NULL;
>   
> @@ -1165,6 +1171,11 @@ static int parse_label_kernel(char **c, struct pxe_label *label)
>   	if (err < 0)
>   		return err;
>   
> +	/* copy the kernel label to compare with FDT / INITRD when FIT is used */
> +	label->kernel_label = strdup(label->kernel);
> +	if (!label->kernel_label)
> +		return -ENOMEM;
> +
>   	s = strstr(label->kernel, "#");
>   	if (!s)
>   		return 1;
> diff --git a/doc/README.pxe b/doc/README.pxe
> index d14d2bdcc9b0..172201093d02 100644
> --- a/doc/README.pxe
> +++ b/doc/README.pxe
> @@ -179,11 +179,19 @@ initrd <path>	    - if this label is chosen, use tftp to retrieve the initrd
>   		      at <path>. it will be stored at the address indicated in
>   		      the initrd_addr_r environment variable, and that address
>   		      will be passed to bootm.
> +		      For FIT image, the initrd can be provided with the same value than
> +		      kernel, including configuration:
> +		        <path>#<conf>[#<extra-conf[#...]]
> +		      In this case, kernel_addr_r is passed to bootm.
>   
>   fdt <path>	    - if this label is chosen, use tftp to retrieve the fdt blob
>   		      at <path>. it will be stored at the address indicated in
>   		      the fdt_addr_r environment variable, and that address will
>   		      be passed to bootm.
> +		      For FIT image, the device tree can be provided with the same value
> +		      than kernel, including configuration:
> +		        <path>#<conf>[#<extra-conf[#...]]
> +		      In this case, kernel_addr_r is passed to bootm.
>   
>   devicetree <path>   - if this label is chosen, use tftp to retrieve the fdt blob
>   		      at <path>. it will be stored at the address indicated in
> diff --git a/include/pxe_utils.h b/include/pxe_utils.h
> index 4a73b2aace34..1e5e8424f53f 100644
> --- a/include/pxe_utils.h
> +++ b/include/pxe_utils.h
> @@ -28,6 +28,7 @@
>    * Create these with the 'label_create' function given below.
>    *
>    * name - the name of the menu as given on the 'menu label' line.
> + * kernel_label - the kernel label, including FIT config if present.
>    * kernel - the path to the kernel file to use for this label.
>    * append - kernel command line to use when booting this label
>    * initrd - path to the initrd to use for this label.
> @@ -40,6 +41,7 @@ struct pxe_label {
>   	char num[4];
>   	char *name;
>   	char *menu;
> +	char *kernel_label;
>   	char *kernel;
>   	char *config;
>   	char *append;

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
