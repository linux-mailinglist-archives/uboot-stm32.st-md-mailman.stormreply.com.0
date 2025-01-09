Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E7A06F8E
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2025 08:56:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D4D1C78F6C;
	Thu,  9 Jan 2025 07:56:40 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90907C78011
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D8001484F01; Thu,  9 Jan 2025 08:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
 t=1736409392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yjAY5ckwgiYuCnX5/5kfkxDTV22zCr2TQRt88JRI/6g=;
 b=aFw+fxzTdfTk+hvsbXH25gsjV9sP6MleLhMGj5INFVdw2OzoGFWt2yQEfFi/dENm8JfBE5
 a0F+dDU6SOCtMBBSDBgtiBnAOYA+chZEf8mL7Nhi72FYKzYr+E62h/1lsI8h/kPtWsTdBT
 2oW2GG5zhJKLXDhLRkX94m3pB/2hFTScwTo+2UL3R1QW1Rk+m4u87yYPa2l0gy8Q8ZdPfz
 qPlU2eElM6+GXLj9IEntijBJQqUz0KoW1F5qTJ50YjWlNXrsp/XkUlax/ZbwEqPSaYOOIf
 dhE1Ohy6pFOtug++upfMwOcy110f5JONLbTJ8Lqm0II2Fe4ADnSo96t1j36bdA==
Date: Thu, 9 Jan 2025 08:56:27 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20250109-aground-daughter-25e667cff177@thorsis.com>
Mail-Followup-To: Patrice Chotard <patrice.chotard@foss.st.com>,
 u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Stefan Roese <sr@denx.de>, Tom Rini <trini@konsulko.com>
References: <20250108150940.558671-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108150940.558671-1-patrice.chotard@foss.st.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>, Rasmus Villemoes <ravi@prevas.dk>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cyclic: Fix rollover every 72 min on
 32 bits platforms
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

Hello Patrice,

Am Wed, Jan 08, 2025 at 04:09:39PM +0100 schrieb Patrice Chotard:
> On 32 bits platforms, timer_get_us() returns an unsigned long which
> is a 32 bits. timer_get_us() wraps around every 72 minutes
> (2 ^ 32 / 1000000 =~ 4295 sec =~ 72 min).
> 
> So the test "if time_after_eq64(now, cyclic->next_call)" is no more
> true when cyclic->next_call becomes above 32 bits max value (4294967295).
> 
> At this point after 72 min, no more cyclic function are
> executed included watchdog one.
> 
> Instead of using timer_get_us(), use get_timer_us() which returns a
> uint64_t, this allows a rollover every 584942 years.

This should be long enough. ;-)
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  common/cyclic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/cyclic.c b/common/cyclic.c
> index 196797fd61e..e3f03a19d55 100644
> --- a/common/cyclic.c
> +++ b/common/cyclic.c
> @@ -61,7 +61,7 @@ static void cyclic_run(void)
>  		 * Check if this cyclic function needs to get called, e.g.
>  		 * do not call the cyclic func too often
>  		 */
> -		now = timer_get_us();
> +		now = get_timer_us(0);

Acked-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

>  		if (time_after_eq64(now, cyclic->next_call)) {
>  			/* Call cyclic function and account it's cpu-time */
>  			cyclic->next_call = now + cyclic->delay_us;
> -- 
> 2.25.1
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
