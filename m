Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDmEB/4gn2lcZAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:10 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB419A6ED
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 17:19:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6B06C87EC3;
	Wed, 25 Feb 2026 16:19:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB145C87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 16:19:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so9948965e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772036348; x=1772641148;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKC0I/zSUXCK7LI/x6OL7XjZ+Bj3ETz1H98338kwM5Q=;
 b=LHJOLoDoFEcnmdsE8ehVULkDNfWe7S+0bb3M4CDkS11592YyWByi0Z4HfAr2mAliwl
 hfBnCz20cgNYKHFs4Tux7xmkR84jqhvTBGBzWEJ1QB2VA3BPyhmJnYZsRYibxcV+pQdk
 TL2lAVmK2vOkZexMPWejEI5f0/LIJn2mMsFDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036348; x=1772641148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fKC0I/zSUXCK7LI/x6OL7XjZ+Bj3ETz1H98338kwM5Q=;
 b=EraGI/OkRvqPcZ0jNZyK7tEq1DcNnutB9BeP31Z+hF1gOtWhfAaffuQ5YA64GsDMAd
 inJPAfR395rvK3NCRX40xiqckJOqn2dvRjnvVgiBNBXBX+4xgfstU76BT3FUgbFSdk0k
 3wFdl3ZVB47ZAR6use+9wol46l8//rq37MtraZTaUyPxx3FZCFxz/25LXoCQY2rrZmW5
 pA9ushRwqGNTfmIKSN1Fssc3eBwRmqoxKPHO3CPMvWwOT51rcPx1kL0/MdH3MtigC6Oi
 6YtTSC6c/i2LJZpYEQ4mp6DvKNwy6J6PYVKKcFFATzpPq822ypZtEb7vIqgMJpzL+6Dz
 QCLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeVyupOMDnFAK4G9E3+/5eHQgto5LB3Zdqb/yQUXwm9zv4trJ98zUQgD/NxYolQERmI13XhDuU3GGYcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRk6UZIzn/O2gOmJhteSNHwkpvTQaQh8fxCGK2A+SACUOskTQs
 LO/2ngfx9B4YK9gNhDOXZTsBtCC0sK9/itjzm6EBiJ/BizrXlz0UINqo76MRMiTENVA=
X-Gm-Gg: ATEYQzylHU1FM4Xvc50AR/Z/h8GQx065pgV69Z8nvKih7NHKbhkf+VbrpzGEnTAK/Di
 qh8E8up6JB+Be3i1lXHO1zc+m3K3TBm9vemms1B80aq1pDc5NfJJNMFCmfa1o8qabBhr+h7RlRr
 cveVf03xs9loJglDeaxQPpYC3B0B0pKmU+PJXunMwNVQA7GRthcIqWAVoB/RZXUMZhO5nGgYef6
 APZNxtMfVswJPZbE+scoFMDhv0KYsMiH+Le/cQ0HblAYmwa1xzP49uV9D0LYiIAe8ThHPV11lrh
 DkxEib7v3M7z1ArJb9cfPzPtAUVlVZK4godJu+g4JC1v37gZDeGcYEUH3SwBS6/XXzDJiR4nZNB
 vJ4pYDhVZ5E11cNGZohd/JfIgxK5dW70qWZgj6i7Dimk3CdZRmnY3n73JfvfYFSc3HIqzX1mRF/
 mwL0CQNR9YRC9yp8Iv6daf7am62qbZCcPKyLrhRnqKUMQHNqP7IrU84WnNcfBvR3FN8DtHaMJ99
 EX0uzBIjIykIZoaxJV4wgURatmQPmd1EOSVPmZwRS8zaMo4
X-Received: by 2002:a05:600c:3552:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-483bd725417mr79218795e9.3.1772036348360; 
 Wed, 25 Feb 2026 08:19:08 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19f5sm186562265e9.1.2026.02.25.08.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 08:19:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Wed, 25 Feb 2026 17:16:59 +0100
Message-ID: <20260225161851.2475274-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
References: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 8/9] spi: stm32: extend support to STM32MP25
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:jagan@amarulasolutions.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,amarulasolutions.com:email]
X-Rspamd-Queue-Id: 08EB419A6ED
X-Rspamd-Action: no action

The SPI IP in this platform is fully compatible with the current driver
implementation, requiring only a new compatible string.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v3:
- Add Reviewed-by tag of Patrice Chotard

 drivers/spi/stm32_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index 9d095b280a70..b7bc5816cc13 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -684,6 +684,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
 };
 
 static const struct udevice_id stm32_spi_ids[] = {
+	{ .compatible = "st,stm32mp25-spi", },
 	{ .compatible = "st,stm32h7-spi", },
 	{ }
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
