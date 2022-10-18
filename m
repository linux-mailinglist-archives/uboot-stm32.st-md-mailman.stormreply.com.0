Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BF6031F0
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:03:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E2D6C64104;
	Tue, 18 Oct 2022 18:03:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8DD3C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:03:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9D85ECE1D28;
 Tue, 18 Oct 2022 18:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8591C433D6;
 Tue, 18 Oct 2022 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666116214;
 bh=QWkEnzXe4AirOPt8IvX9l/+PaI42GfK1oUrDNgq2EfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecEbNFys5yR+kDL9EE1fOqNbyFoNPYRTJ4va/HRmL3e91wZ/mxsu9c5NpojTnSDTl
 3vFkM1a15nYeuXOwAZmwI22KSbMfbpozuEcTALJh7e8hPpra/3Iy2ujcKO5HYtEXTu
 JuwR0QMX7/MEUqnJiPifpsm98ZYqHiI4/jFJv4m1n6mEkqR+UkXKoXkytugPinsTJa
 MXX/Hx40OS302Jvtu/MM88o6pdnqxMa5icZKkDNdFAJD/g2pX+puih5f6sUeyZUJUd
 DuT+qUE1IxtMlFu/dYIb1Nr4rVuYxEbW397mFxqlj0zjdrOSPa/jZpvdPddFnoimeH
 SjUIk7DzMHGnw==
Received: by pali.im (Postfix)
 id D04BA76B; Tue, 18 Oct 2022 20:03:31 +0200 (CEST)
Date: Tue, 18 Oct 2022 20:03:31 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221018180331.sgsufsip2p2544ip@pali>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018174827.1393211-1-max.oss.09@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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

On Tuesday 18 October 2022 19:48:27 Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> With LTO enabled the U-Boot initial environment is no longer stored
> in an easy accessible section in env/common.o. I.e. the section name
> changes from build to build, its content maybe compressed and it is
> annotated with additional data.
> 
> For GCC adding the option '-ffat-lto-objects' when compiling common.o
> adds additionally the traditional sections in the object file and
> 'make u-boot-initial-env' would work also for the LTO enabled case.
> However clang doesn't have that option.
> 
> Fix this by recompiling common.o into a object file only used for
> the creation of u-boot-initial-env if LTO is enabled.
> 
> See also:
> https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com/
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 
> ---
> 
>  Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3866cc62f9a..cd45c720d23 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2451,9 +2451,17 @@ endif
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>  
>  quiet_cmd_genenv = GENENV  $@
> +ifeq ($(LTO_ENABLE),y)
> +cmd_genenv = $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/initial_env.o env/common.c; \
> +	$(OBJCOPY) --dump-section .rodata.default_environment=$@ env/initial_env.o; \
> +	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
> +	sort --field-separator== -k1,1 --stable $@ -o $@; \
> +	rm -f env/initial_env.o env/initial_env.su
> +else
>  cmd_genenv = $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/common.o; \

This code is still broken because in some cases section name is not RO.

So instead of using section name, I would rather suggest to compile
simple host application which prints it.

>  	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
>  	sort --field-separator== -k1,1 --stable $@ -o $@
> +endif
>  
>  u-boot-initial-env: u-boot.bin
>  	$(call if_changed,genenv)
> -- 
> 2.35.3
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
