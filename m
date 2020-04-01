Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD819AAA0
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:19:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBAC4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 11:19:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB329C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:19:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48skGz3zJtz1qrg4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:19:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48skGz3PPbz1r0cS
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:19:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id yyUVgB5RmD-j
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:19:06 +0200 (CEST)
X-Auth-Info: 8fUPnu6wcTK12OI4lEqc+Suy5upyOCAKuIJdowD2tTE=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:19:06 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id 08316A2C44; Wed,  1 Apr 2020 13:19:06 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id E8CC2A12F3;
 Wed,  1 Apr 2020 13:18:59 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id C78A224003E;
 Wed,  1 Apr 2020 13:18:59 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Tue, 31 Mar 2020 18:04:20 +0200."
Date: Wed, 01 Apr 2020 13:18:59 +0200
Message-Id: <20200401111859.C78A224003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: reset to default
	environment when serial# change
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

Dear Patrick,

In message <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid> you wrote:
> Serial number is first checked and, in case of mismatch, all
> environment variables are reset to their default value.
>
> This patch allows to detect that environment is saved in a removable
> device, as a SD card, and reused on a other board, potentially with
> incompatible variables.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 9aa5794334..365c2aa4f7 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -511,8 +511,9 @@ __weak int setup_mac_address(void)
>  		return -EINVAL;
>  	}
>  	pr_debug("OTP MAC address = %pM\n", enetaddr);
> -	ret = !eth_env_set_enetaddr("ethaddr", enetaddr);
> -	if (!ret)
> +
> +	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
> +	if (ret)
>  		pr_err("Failed to set mac address %pM from OTP: %d\n",
>  		       enetaddr, ret);

This is an unrelated and totally undocumented change.  Please split
into separate commit.


> +
> +	if (serial_env) {
> +		if (!strcmp(serial_string, serial_env))
> +			return 0;
> +		/* For invalid enviromnent (serial# change), reset to default */
> +		env_set_default("serial number mismatch", 0);
> +	}

Resetting the enviropnment to the defaults means you drop all
setting sa user may have made.  This is a very bad move - as a user
I find such things completely unacceptable.  If I make any changes,
they must never ever be killed without my explicit confirmation.

I strongly advice against such a method. Please drop that.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"You ain't experienced..." "Well, nor are you." "That's true. But the
point is ... the point is ... the point is we've been not experienced
for a lot longer than you. We've got  a  lot  of  experience  of  not
having any experience."           - Terry Pratchett, _Witches Abroad_
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
