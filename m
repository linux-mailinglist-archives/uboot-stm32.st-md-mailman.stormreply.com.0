Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r8K5IT/NOGo8iQcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:55 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE16ACD4F
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=geanix.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2CE6C9AE46;
	Mon, 22 Jun 2026 05:50:54 +0000 (UTC)
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch
 [79.135.106.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E26FCC2909A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail3; t=1781774986; x=1782034186;
 bh=OI6S6Fntp75HDKJ0WilhyzZNSqYTkL5lR0c6zq0ShIg=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=MuvBQpBJdy6QIIkiwe0G+qvkAeaURciqwInJMiwEKukNAdr842l5lXTKgid3geSf5
 yl/U7Am6WG6XMZu4EfaGL0iTMX/6gjftXRC2WEKu+NHnd4zAandv9vyxc6XXENJ8AY
 f1PJW8QsqNeJg3uXp8z3JsdrQPXWOBL1Q1z6F/k0p7boKaLtpyqBty1LtBoX9Ofhsm
 b68PGyCH/RIKpehVwGmOa0b0bal5BlNZVe/Iyy3So0eAJJcoheJu4HxZK0sZ+3TP4Y
 5uxMHK8d/MiXgVe1t4gFz7upvAr+mS1RisKqov38qSeWvl7TMT2RfzdxADYzy/sjaN
 cmLT46trZUVyg==
X-Pm-Submission-Id: 4ggwRX4F05z2ScXX
From: Sean Nyekjaer <sean@geanix.com>
To: Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 18 Jun 2026 11:29:19 +0200
Message-ID: <20260618092921.3702970-1-sean@geanix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2026 05:50:53 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: use debug() for image entry point
	message
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[geanix.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[92];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sean@geanix.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:sean@geanix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sean@geanix.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32CE16ACD4F

The stm32mp1 specific code prints the image entry point unconditionally
before jumping to the next-stage image, unlike the generic SPL
implementation in common/spl/spl.c.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index 252aef1852e..ea5d8a648df 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -361,7 +361,7 @@ void __noreturn jump_to_image(struct spl_image_info *spl_image)
 	image_entry_stm32_t image_entry =
 		(image_entry_stm32_t)spl_image->entry_point;
 
-	printf("image entry point: 0x%lx\n", spl_image->entry_point);
+	debug("image entry point: 0x%lx\n", spl_image->entry_point);
 	image_entry(romapi);
 }
 #endif
-- 
2.52.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
