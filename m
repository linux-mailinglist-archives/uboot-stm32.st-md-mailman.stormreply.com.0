Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB53D2D11
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 22:00:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46904C5A4CD;
	Thu, 22 Jul 2021 20:00:36 +0000 (UTC)
Received: from mail.nic.cz (lists.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFC28C597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 20:00:34 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id E96D013FD0A;
 Thu, 22 Jul 2021 22:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1626984034; bh=qHWZ4M0Cbme2nk82HUd8BAYVGtZTGBwM3i+B9UX122U=;
 h=Date:From:To;
 b=ctEmWRKufD28WSC5K7DnTVsBupyYep1KP+u2QMxqftuchVxcjxBwx4c9vuAIXbtgt
 n0lDo73YLkMTnzYaMiaxxlq1gppiKVZo40lEgEAwAFr7yNhHNDbSyzXJdRF3MXbA2+
 1z+HjGHXJD8XpxZpJmmzrcued7OiOK1K/zXt2Ebw=
Date: Thu, 22 Jul 2021 22:00:33 +0200
From: Marek Behun <marek.behun@nic.cz>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210722220033.585757c9@thinkpad>
In-Reply-To: <20210721095553.RESEND.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
References: <20210721095553.RESEND.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Bin Meng <bmeng.cn@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] build: remove the variable NM in
 gen_ll_addressable_symbols.sh
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

On Wed, 21 Jul 2021 09:56:07 +0200
Patrick Delaunay <patrick.delaunay@foss.st.com> wrote:

> With LTO activated, the buildman tools failed with an error on my
> configuration (Ubuntu 20.04, stm32mp15_trusted_defconfig) with the error:
> 
> ../arm-linux-gnueabi/bin/nm:
> 	scripts/gen_ll_addressable_symbols.sh: file format not recognized
> 
> It seems the shell variable initialization NM=$(NM) is not correctly
> interpreted when shell is started in the Makefile, but I have not this
> issue when I compile the same target without buildman.
> 
> I don't found the root reason of the problem but I solve it by
> providing $(NM) as script parameter instead using a shell variable.
> 
> The command executed is identical:
> 
> cmd_keep-syms-lto.c := NM=arm-none-linux-gnueabihf-gcc-nm \
> u-boot/scripts/gen_ll_addressable_symbols.sh arch/arm/cpu/built-in.o \
> .... net/built-in.o >keep-syms-lto.c
> 
> cmd_keep-syms-lto.c := u-boot/scripts/gen_ll_addressable_symbols.sh \
> arm-none-linux-gnueabihf-gcc-nm arch/arm/cpu/built-in.o \
> ... net/built-in.o > keep-syms-lto.c
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Resend with correct commit message for patman
>   s/Serie-cc/Series-cc/
> 
> 
>  Makefile                              | 2 +-
>  scripts/Makefile.spl                  | 2 +-
>  scripts/gen_ll_addressable_symbols.sh | 5 ++++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ca2432c8ce..140dea09f4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1736,7 +1736,7 @@ u-boot-keep-syms-lto_c := $(patsubst %.o,%.c,$(u-boot-keep-syms-lto))
>  
>  quiet_cmd_keep_syms_lto = KSL     $@
>        cmd_keep_syms_lto = \
> -	NM=$(NM) $(srctree)/scripts/gen_ll_addressable_symbols.sh $^ >$@
> +	$(srctree)/scripts/gen_ll_addressable_symbols.sh $(NM) $^ > $@
>  
>  quiet_cmd_keep_syms_lto_cc = KSLCC   $@
>        cmd_keep_syms_lto_cc = \
> diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
> index 5be1a9ba1b..25a3e7fa52 100644
> --- a/scripts/Makefile.spl
> +++ b/scripts/Makefile.spl
> @@ -459,7 +459,7 @@ u-boot-spl-keep-syms-lto_c := \
>  
>  quiet_cmd_keep_syms_lto = KSL     $@
>        cmd_keep_syms_lto = \
> -	NM=$(NM) $(srctree)/scripts/gen_ll_addressable_symbols.sh $^ >$@
> +	$(srctree)/scripts/gen_ll_addressable_symbols.sh $(NM) $^ > $@
>  
>  quiet_cmd_keep_syms_lto_cc = KSLCC   $@
>        cmd_keep_syms_lto_cc = \
> diff --git a/scripts/gen_ll_addressable_symbols.sh b/scripts/gen_ll_addressable_symbols.sh
> index 3978a39d97..b8840dd011 100755
> --- a/scripts/gen_ll_addressable_symbols.sh
> +++ b/scripts/gen_ll_addressable_symbols.sh
> @@ -5,8 +5,11 @@
>  # Generate __ADDRESSABLE(symbol) for every linker list entry symbol, so that LTO
>  # does not optimize these symbols away
>  
> +# The expected parameter of this script is the command requested to have
> +# the U-Boot symbols to parse, for example: $(NM) $(u-boot-main)
> +
>  set -e
>  
>  echo '#include <common.h>'
> -$NM "$@" 2>/dev/null | grep -oe '_u_boot_list_2_[a-zA-Z0-9_]*_2_[a-zA-Z0-9_]*' | \
> +$@ 2>/dev/null | grep -oe '_u_boot_list_2_[a-zA-Z0-9_]*_2_[a-zA-Z0-9_]*' | \
>  	sort -u | sed -e 's/^\(.*\)/extern char \1[];\n__ADDRESSABLE(\1);/'

Shouldn't we use "$@" ? In case the arguments contain spaces?

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
