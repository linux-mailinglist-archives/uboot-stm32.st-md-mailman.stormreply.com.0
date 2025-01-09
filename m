Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585BA06F8D
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2025 08:56:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3492CC78F67;
	Thu,  9 Jan 2025 07:56:40 +0000 (UTC)
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92976C78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:56:38 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4YTHDM5XSpz9sV6;
 Thu,  9 Jan 2025 08:56:35 +0100 (CET)
Message-ID: <ef52a3dd-3851-44e8-878e-09c10265ff7b@denx.de>
Date: Thu, 9 Jan 2025 08:56:34 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250108150940.558671-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250108150940.558671-1-patrice.chotard@foss.st.com>
X-Rspamd-Queue-Id: 4YTHDM5XSpz9sV6
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 08.01.25 16:09, Patrice Chotard wrote:
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
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>   common/cyclic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/cyclic.c b/common/cyclic.c
> index 196797fd61e..e3f03a19d55 100644
> --- a/common/cyclic.c
> +++ b/common/cyclic.c
> @@ -61,7 +61,7 @@ static void cyclic_run(void)
>   		 * Check if this cyclic function needs to get called, e.g.
>   		 * do not call the cyclic func too often
>   		 */
> -		now = timer_get_us();
> +		now = get_timer_us(0);
>   		if (time_after_eq64(now, cyclic->next_call)) {
>   			/* Call cyclic function and account it's cpu-time */
>   			cyclic->next_call = now + cyclic->delay_us;

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
