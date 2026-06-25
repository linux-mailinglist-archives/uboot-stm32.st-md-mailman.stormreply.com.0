Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38h3NdCoPWoj5QgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2026 00:16:48 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB76C8E97
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2026 00:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b="Qtdbs//1";
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A17CEC424DB;
	Thu, 25 Jun 2026 22:16:47 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68B48C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 22:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A8AA1159C3; Fri, 26 Jun 2026 00:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1782425805;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=RIDgihSZQPOalPp9AT5wGHELq1kb0TtUxgcLI+/XeeQ=;
 b=Qtdbs//1djA85CsUktcL+lsaZPqtbI0lpIko8JFU71ZAzh/7RmpFYxWCF56c2eTcGgD4mM
 EiWlXhR3zEvh7Hfk4HiyMLunOj3L94+ViiHesT/ZsDrsGk3+trcfEEz40chTOTBF3rIsJ/
 uNzN5yMzrIf0LGgFkCrUrfEan4LnTUtBoIkvCHaIJbcS8SjD2YKxkQVEQuFx2twBQJlsvJ
 n00xrvnhfLLUkiwGNTeTx8zzlawGWF/syoKymPVqHGKv0km/im4VS+q9M5ozXJ57HABWsC
 TPoNvEqqjyRNCfxSMs8Kwaj20IfZERq+X5fV8Pt1nJEs1P74A0LltVeMTOC+8w==
Message-ID: <bf804b49-55fd-4bfc-9898-2265dfad95d7@nabladev.com>
Date: Thu, 25 Jun 2026 14:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Sean Nyekjaer <sean@geanix.com>, Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20260618092921.3702970-1-sean@geanix.com>
 <4e7b14fd-da00-42d5-9221-719313eecfab@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <4e7b14fd-da00-42d5-9221-719313eecfab@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: use debug() for image entry
	point message
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:sean@geanix.com,m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,geanix.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03DB76C8E97

On 6/25/26 8:31 AM, Patrice CHOTARD wrote:
> 
> 
> On 6/18/26 11:29, Sean Nyekjaer wrote:
>> The stm32mp1 specific code prints the image entry point unconditionally
>> before jumping to the next-stage image, unlike the generic SPL
>> implementation in common/spl/spl.c.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>   arch/arm/mach-stm32mp/stm32mp1/cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> index 252aef1852e..ea5d8a648df 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> @@ -361,7 +361,7 @@ void __noreturn jump_to_image(struct spl_image_info *spl_image)
>>   	image_entry_stm32_t image_entry =
>>   		(image_entry_stm32_t)spl_image->entry_point;
>>   
>> -	printf("image entry point: 0x%lx\n", spl_image->entry_point);
>> +	debug("image entry point: 0x%lx\n", spl_image->entry_point);
>>   	image_entry(romapi);
>>   }
>>   #endif
> 
> + Marek, as he is the author of the path which brang jump_to_image()
> 
> Personally i don't mind of usage either printk() or debug().
> Marek, what do you prefer ?
debug() is fine, thanks !
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
