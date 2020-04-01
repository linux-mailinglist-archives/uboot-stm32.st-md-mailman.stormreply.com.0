Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4B19AACD
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:30:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6CDCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 11:30:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6172BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:30:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48skX300zvz1rrLM
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:30:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48skX26zpvz1r0cS
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:30:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id 3D2hmitTkoh7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:30:26 +0200 (CEST)
X-Auth-Info: T/EbAX3X4jsIEY3lyMJJrixmJRyJ2u1/Lh6xN+H0/o4=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:30:26 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id D3D40A2C3B; Wed,  1 Apr 2020 13:30:25 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id C8BCEA2B96;
 Wed,  1 Apr 2020 13:30:19 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 73B6724003E;
 Wed,  1 Apr 2020 13:30:19 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Tue, 31 Mar 2020 18:04:23 +0200."
Date: Wed, 01 Apr 2020 13:30:19 +0200
Message-Id: <20200401113019.73B6724003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: spl: display error in
	board_init_f
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

Dear Patrick Delaunay,

In message <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid> you wrote:
> Update board_init_f and try to display error message
> when console is available.
>
> This patch adds trace to debug a spl boot issue when DEBUG
> and DEBUG_UART is not activated, after uart probe.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/spl.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index ca4231cd0d..dfdb5bb7e9 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -79,37 +79,36 @@ void spl_display_print(void)
>  void board_init_f(ulong dummy)
>  {
>  	struct udevice *dev;
> -	int ret;
> +	int ret, clk, reset, pinctrl;
>  
>  	arch_cpu_init();
>  
>  	ret = spl_early_init();
>  	if (ret) {
> -		debug("spl_early_init() failed: %d\n", ret);
> +		debug("%s: spl_early_init() failed: %d\n", __func__, ret);
>  		hang();
>  	}
>  
> -	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
> -	if (ret) {
> -		debug("Clock init failed: %d\n", ret);
> -		return;
> -	}
> +	clk = uclass_get_device(UCLASS_CLK, 0, &dev);
> +	if (clk)
> +		debug("%s: Clock init failed: %d\n", __func__, clk);
>  
> -	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
> -	if (ret) {
> -		debug("Reset init failed: %d\n", ret);
> -		return;
> -	}
> +	reset = uclass_get_device(UCLASS_RESET, 0, &dev);
> +	if (reset)
> +		debug("%s: Reset init failed: %d\n", __func__, reset);
>  
> -	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> -	if (ret) {
> -		debug("%s: Cannot find pinctrl device\n", __func__);
> -		return;
> -	}
> +	pinctrl = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> +	if (pinctrl)
> +		debug("%s: Cannot find pinctrl device: %d\n",
> +		      __func__, pinctrl);
>  
>  	/* enable console uart printing */
>  	preloader_console_init();
>  
> +	if (clk || reset || pinctrl)
> +		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
> +		       __func__, clk, reset, pinctrl);
> +

This change makes little sense to me/  If you want error messages,
then just turn above debug() into printf(), and be done with it.
As an additional benefit so see at once which step failed.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
A Chairman was as necessary to a Board planet  as  the  zero  was  in
mathematics, but being a zero had big disadvantages...
                         - Terry Pratchett, _The Dark Side of the Sun_
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
