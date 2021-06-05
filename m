Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3231A39C9B3
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Jun 2021 18:02:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3593C57B69;
	Sat,  5 Jun 2021 16:02:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0E8C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jun 2021 16:02:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c9so3647337wrt.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=IcfQH8P1AZwSKKmTUCBZp+GynCS7WhQNWqhh7dDZdJE=;
 b=ZGSmEgiiuu+eNS2evrSMx8O77jLIoRT8sloxQslvb9KM7Hx+w2IqY/TN5Sw5V3pzGg
 7/FZ+nVYaHDUzPhs7tBso/c3JUNRhXij+TGE4JyUGkfuRaLprPq3Dz/M+DgnyCu9jnQf
 24c0ZUHNTMxKFvCJddExav91Eo6ZR0llNVm+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=IcfQH8P1AZwSKKmTUCBZp+GynCS7WhQNWqhh7dDZdJE=;
 b=mS1RTOoJVCWfWIrPFW6dxUoDPPIzyXrnDuAOzkr1WurJOcsGyfPNSGQbbNRWh65KBV
 1YZ1lBhPbKyDXMFIHPuBrhO3cxZ+gAB97ZKE0wN7fmvXsBGdF9gkMLkit9Ei6Y6F0YEB
 0ny4zAGI9svI5FRG1T9jZRkiWds+j9LSHtib7BUTm/JuHOBgknu4RYCzlPJBQYk+/D8v
 SGhVlypli6reYjgxksn25zekxHowLWGWOU1hhhCqlGGolhg4GS3uc8UJE1haJFyMIoF5
 c9iHrESqe86RwSyOhb7X1V+Aymnj49rRMTnTZHxlqueIui57X/9Ck+Js/SOkit3nIfe2
 nGnA==
X-Gm-Message-State: AOAM530HXvBDoojtxWKgp2tSRBKELrpn0fL9+eDDpNXRx+osNX0pvqt8
 vYfsplatoWywaweF1TlfMy1xxLxS1MVgbEe2iGNRcA==
X-Google-Smtp-Source: ABdhPJzsP5l03s9bLiQV8fiMkKsTaw7yyK1/oRie5mR4oG7sGOiKEsGhvfrOtPdOPgZR2YivovyI4ES2yAQpZeKMVK4=
X-Received: by 2002:adf:df87:: with SMTP id z7mr9236947wrl.56.1622908921389;
 Sat, 05 Jun 2021 09:02:01 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 09:01:59 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20210521122438.v2.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
References: <20210521122438.v2.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
 <20210521102500.12981-1-patrick.delaunay@foss.st.com>
Date: Sat, 5 Jun 2021 09:01:59 -0700
X-Google-Sender-Auth: YVfdC154GW6I7WPIWP3GnxnGKtM
Message-ID: <CAPnjgZ3y1+q+wiZ_356Vr8-d02V56nGveJFLp6ffG3g05QsHaQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] test: add dm_test_read_resource
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

Add a test of dev_read_resource with translation or without translation

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add reviewed-by
- use lower-case hex

 test/dm/test-fdt.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
