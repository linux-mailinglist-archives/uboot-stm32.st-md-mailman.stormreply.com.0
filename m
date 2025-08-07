Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DCB1D564
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:04:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29DACC3F953;
	Thu,  7 Aug 2025 10:04:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCE6BC3F950
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:04:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so370883f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754561047; x=1755165847;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EXdeBW/H7RP7k993IVsC1jLetE6W3MyWvtt/jd1yjX0=;
 b=A9ZJ8bHstwuwL/+bPgfArIXYJDzt+eq5yGt4eTDKfWKr2s46pEbGy4IvziaDHbzUqi
 yVkXnjN3FPDf+wg+KYZYnh7yA0itL9hAEVvsn/F9KKCfZJCNfNkNlz44ABgQL5ptXciT
 qekLvyf0IbYvdURxPcZBT9NCMP6LBXzeaKpY4C75vIwqM3ZwrSFfPygCkkkB3ib1gfjD
 jWNDDpUCsots1R8XDP9I1jLa5aD0xH94S66NOFDW90NppFGKLQBTgSlJrwUm2rFa2SCh
 pnvPu2+erCAfnB147duAe8unl4URdUmCNg47hKYI8jFrrFmO7ypMsSMq/8nuNPCAE76Y
 s6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754561047; x=1755165847;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EXdeBW/H7RP7k993IVsC1jLetE6W3MyWvtt/jd1yjX0=;
 b=G77We3bdEOik+ap/9YlR/CYcoQArjmD1KeagcAnQCqP1enkSkrP7sZ3xhv+ABY4Dco
 aasoeojwWRdvNVdLXDHcVe2QVd5sEtDs29UKYBgN0C+6cahWl+5eZtYnIbBorJZrYD9x
 K8zDue3JKicK6wNwHcot/N2DkdtQaI3zGJjFN3gTZxHjM0qz3u0NuEdx/E31/Eia2pyf
 q+fqiGV6M+mJ17OU/9iw4+PBKno+GIahdk/SHPQUueQbs1g6jRJ/oxRMCUbukNr3q2YA
 0KcFHxIU7fhhGzClKHARQkRhlEFYv3Itpek2wMPoNQf8ugdBVY5sgQgo/OJsgCXW+r/w
 5cMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU9z4I7aUaoF15PlCYl4eAo+PYSE1FMt6BQVgJUcG1ocrqLEuj3wWV1Xp0NryfRwqQlkUZcPPEykpEMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2lo5oEM3Fjtyds2SKEe11rO3gDxEtcJvROe+Menb22TUnVrH4
 /wsf60juXMLl5cSBOVBeAkWSEkieMPqckqkdQoDvPVUVrY61fws+lOgFGJplJXQfzjM=
X-Gm-Gg: ASbGncsK7xR913ogLY1UYHE9OxjCSOSWvYBySPJ6YppB7N7HnGuJi2iLQAvezG7WNrL
 qSwRHu0mtX/cnfEWqqKlDdVoF3H7Q6L+OFa3snOL4uJxH4eHnWS9NNo+8OChY4cgdtvjmghzkc7
 qS4yUsTw4WI+9ubHvM+ifl+rk002oMsBfFSHVD4Yr7haZLjKuYLrd3ojdrEEtPVGDvNKkmbAL54
 MTTuUc3bUQElGcQJCSf8AdWqs9KZHwWXesmucg/OkBj+4S0PWy0RONAXXmpTEgDr7QlZ26/xuL/
 9mU7iFwjGFPTFMsC3Re9EbxitKgVss1j2xC9gYoy9j8o7/chrTcC/vIzhO9Cif1CqxiPG73MY2O
 8tDxNEpU5Q9/eUtTsaoqGbKbj+eHw/+DHI/LcrK5xjzc0lVwY1yU=
X-Google-Smtp-Source: AGHT+IFKXXaAoEDPifWZi+eU9cqDc8OzlMei8/bghwAY0XucppWGX3Yga/gQYl/jpadw4wrkzk/yNA==
X-Received: by 2002:a5d:64c4:0:b0:3b8:eb9f:a756 with SMTP id
 ffacd0b85a97d-3b8f9f21213mr1877345f8f.11.1754561047097; 
 Thu, 07 Aug 2025 03:04:07 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:377e:cf4f:d0ff:80bf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm358481575e9.25.2025.08.07.03.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:04:06 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 07 Aug 2025 11:04:02 +0100
MIME-Version: 1.0
Message-Id: <20250807-pinctrl_misc-v1-1-eeb564a1b032@linaro.org>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
In-Reply-To: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/4] pinctrl: single: Remove unreachable code
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

In single_read there is a switch block with a default label. All cases
in the switch block, including the default, return directly. So any code
following the switch block is unreachable. Remove the unreachable code.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index a3802d22d4f..c96b293aadf 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -109,8 +109,6 @@ static unsigned int single_read(struct udevice *dev, void *reg)
 	default: /* 32 bits */
 		return readl(reg);
 	}
-
-	return readb(reg);
 }
 
 static void single_write(struct udevice *dev, unsigned int val, void *reg)

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
