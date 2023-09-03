Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82D790DF0
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C466C6B452;
	Sun,  3 Sep 2023 20:48:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 805F9C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:48:54 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-99bcc0adab4so124082866b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774134; x=1694378934;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7v/T47c4cyvP0ZBQxSABDrZzKs6stbyxJ2yX9+Ibn8w=;
 b=jWvRkP41T2TpmbN0r2nmvVuEpV4z3d4tf9/JD8/iDZDJEh+mdNrcjifZ9ktM1LJs9Q
 ZWmBVxEMFd+2ir8cYHBUEELMCAVfwTDIWlBJ9Q4ZWLmO1GAa8G8t27DkEIWVHNbV6Oxt
 ygBTRECj7etIUI0eS/8FYVDQDxyQIbWhxNXrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774134; x=1694378934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7v/T47c4cyvP0ZBQxSABDrZzKs6stbyxJ2yX9+Ibn8w=;
 b=AyxANkTKe5n8cVw0viMoFF+HXkUwcBH6H+dX9eA6vKQF60NRhf30naxGji6atHLMhe
 ZiyD7g3QT2NH2V3RQPrtKxO6Ud7fzZrDdj+JxBUhLGIpEVK1fwoDEoiy/FZslilFhU1T
 b2WeMNa0/I+Guh/1SnABM1Gkl/9PIVv2Byut3rilGLK3sMmnLKtPW89AJ8nSW1gG35n6
 og6uU+b75eLs4qFG0eGpCbXqSTWJWY0p8do+6inI4gjrAmie3L/RIg2/9pkzkjsM3TZg
 mf0sWy4xQoxo6dI1Fr6TZWo2Oks7dTmh9LOJUI+lMhQpagZ8LW0+wvzFFTL0tSClsZSc
 Pm9g==
X-Gm-Message-State: AOJu0YxAFgH9Fd4966AVX3/AopSzHzlzqNB6deqHEGBxTorwnU8nrnJn
 Z1Bgd1MrI9WQmf907f5mRclXAw==
X-Google-Smtp-Source: AGHT+IEd+voLKr49j9NBJ2ZPx0YBVE/q6iq3Wj+HRes2K0jTK2A5HB0gttgtu5yF3yXaQBMeOm04ng==
X-Received: by 2002:a17:906:1009:b0:9a5:db06:4264 with SMTP id
 9-20020a170906100900b009a5db064264mr6718778ejm.72.1693774134022; 
 Sun, 03 Sep 2023 13:48:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:48:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:40 +0200
Message-Id: <20230903204849.660722-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Lee Jones <lee@kernel.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 01/10] dt-bindings: mfd: stm32f7: Add binding
	definition for CAN3
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

commit 8f3ef556f8e1a670895f59ef3f01e4e26edd63e3 Linux upstream.

Add binding definition for CAN3 peripheral.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20230423172528.1398158-2-dario.binacchi@amarulasolutions.com
Signed-off-by: Lee Jones <lee@kernel.org>
---

 include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
index ba5cb7456ee4..a4e4f9271395 100644
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ b/include/dt-bindings/mfd/stm32f7-rcc.h
@@ -64,6 +64,7 @@
 #define STM32F7_RCC_APB1_TIM14		8
 #define STM32F7_RCC_APB1_LPTIM1		9
 #define STM32F7_RCC_APB1_WWDG		11
+#define STM32F7_RCC_APB1_CAN3		13
 #define STM32F7_RCC_APB1_SPI2		14
 #define STM32F7_RCC_APB1_SPI3		15
 #define STM32F7_RCC_APB1_SPDIFRX	16
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
