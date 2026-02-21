Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDwBNY5/mWnfUQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:02 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6A16C897
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 Feb 2026 10:49:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CE8FC8F275;
	Sat, 21 Feb 2026 09:43:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55C5DC87ED6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 09:43:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4362507f0feso1715547f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 01:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771666989; x=1772271789;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgG5cD+hbVHDRbzg/eLGiw+5QkTuTClXczKpZCB2jco=;
 b=Pd5IbqUucTwO0FvUcoFTAIRTJMw3yXlHACzbg5tljZ+iIZNa2267FKzjou5rDBnlbY
 n1INPGnuo3h501a4tYUfZbuuMtLs8aivG2Gnad6+7O0p3rY+82f/P8zEQjGrVfL86Y4+
 ElmaUBJxQeYP85Ebvw12nlDI8k4u2i+kU/veM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771666989; x=1772271789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bgG5cD+hbVHDRbzg/eLGiw+5QkTuTClXczKpZCB2jco=;
 b=KScGg6+JpCZzyUoM9x6eJLOeHSqo0L67hcT8rsCX/bZm8T9WsPDv2hawIobx1RzH5w
 F9xQmx6vlSwT41Uu2aPtauZgkN8RL2fh2UNcAm571oWoS6JocFKXP0hNtHvjmsrJogFZ
 yeoi33DzZ5dyvhxV5/Kjm3IftN+KqUt+6LENGEYjoWGQUZQo2lROuk0DRTwVcf+byJR0
 mk5BUy8Q3Tf+by4pt/yd0u7vsr6Xy2BVsEhMKkXC/f2uT5cD2pdvbSqXRyDygXJycWIO
 BUD1tSh83uXOTcb+pNh5GFhZsa6TzQPykWIkaC6E2gPFgqNckuH6UiAWqrJiug5wTYZ2
 RbnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBRPG38+DPsqxsSykjfW2bPGYXMsLGNo92xcF6zM9WjUwKVM8rJoM1E3HCuNRYdEL0XTavmv+GGCgOIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzh+9+SCF+mc6FnjLbQIDhk5wLfeL+jJtIXoRW7KCIt+PU0CHN9
 qvQybiR29CePArmYoPTcHC/Fhc/ilbsYDX6DM2NCyWyT8d3XiJZlu+4C0rdbswvDrIg=
X-Gm-Gg: AZuq6aLefNUsImCfvBhmYgtF8dND9t+7uJCWlYrebOqgUXySA0uTeT5Er7wF7KoVjg3
 QOnUEsRVF4ZAwqo+nJJ+TmczeD6umGWhYc4fH0b7bmKC64+0fpKu0I2wspq9X/RTQYyu155gORh
 uKzywa/FIMogIV2jXa9G348ON+oKuCMAADaF0aKBQqBIMD0UGVP7fgGGG/EFUWLldfS+2Twv1NP
 1lwWZwsXq0sQ6vC29cRBWo6c6PGms1X6rcGGMtCWG4j8e1Hfu+tOyr4M7iWR6JEiWvrLu4VZ+lu
 LgoL+5pAKXFFlScHCTdJ2gi9OGPUAX//qcMwhbt6whZ1HupIHyS+7RpSOhdyRxr2fMTQ9OqJGrF
 8BQT24fifU4X8dM7NVV5mA4dMfgft4TS2xBnpu3/WCL7Mqg8NM566SyGTbaO+lIewkU5EMbnFjr
 /apRY4kgH7DqeCOSB/XLdwTQ5o0lM+yGFm8M1cjlSBeMIaJqUF5L31s3I0JxwzBh0luNLJbwFQR
 WjP5VBuricrGdrWZTJtKqOluBEz4bKh/Yy5sLcZdgADHBn2fUfRyssRDQcaO56jvNW8TY33fX18
 OcQmo8AdTgEc8XFd9AK2jmAp
X-Received: by 2002:a05:600c:a00b:b0:480:4a8f:2d5c with SMTP id
 5b1f17b1804b1-483a9637a86mr32258035e9.29.1771666988736; 
 Sat, 21 Feb 2026 01:43:08 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a42f3968sm42694225e9.19.2026.02.21.01.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 01:43:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 21 Feb 2026 10:42:21 +0100
Message-ID: <20260221094252.3103034-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
References: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 7/8] spi: stm32: extend support to STM32MP25
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
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,amarulasolutions.com:email]
X-Rspamd-Queue-Id: 62B6A16C897
X-Rspamd-Action: no action

The SPI IP in this platform is fully compatible with the current driver
implementation, requiring only a new compatible string.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/spi/stm32_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index 39ea69c68174..903cc3702807 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -686,6 +686,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
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
