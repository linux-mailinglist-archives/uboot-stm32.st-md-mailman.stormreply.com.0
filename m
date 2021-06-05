Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716D39C9B4
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Jun 2021 18:02:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB085C57B6D;
	Sat,  5 Jun 2021 16:02:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BF86C57B69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jun 2021 16:02:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l2so12352897wrw.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=fOvdRs5Y+DU4rOzzHAjy/ATm7QauzJaFYYyB58WsttY=;
 b=WFflNfNRIXMEfh6UgHoGAJCaG5GveqfoDvVrELQ9h6D3y9A8JbyHA4ZUFrOR2r6cq2
 d6BAcgjnIUrHUMUYWfV0BlWeL4aSZeDxXMGYBla9Lyr/ODV4/tJZdtX8CrYWqZghkOrF
 LCJcK2psieOSOTeTs33awLI8/lG48QeGxLc7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=fOvdRs5Y+DU4rOzzHAjy/ATm7QauzJaFYYyB58WsttY=;
 b=e+OjkyJIfVpAipYULJM/wCaYiSyJYypi8D57kT+gCpq999bBZ+FEAelXPIwNJCfVhc
 QM4rb/3ZEJMHiA0+EkS7iEE01K0RBLfY2R8NDd9HDdbuQyt0uSRV8KF81pBNT1GFAX3g
 7ymIREVu5OzXa7Aj9yINesawGMqPq3Ns41tS2hw6rZDjK8FCmB8BhTw8DxcngrSQOJKX
 MugKMHWyc8bci3pmRDSX/yjoE4iLvsFAOWX4C/BZ43YLgZz3M9REhoT/cmJOPLi44WFp
 K9UnQcV4pVrXp6osgOhkBYXaHv+36OQAZikc7b7rQuC63XQyCyuUF7zVMfuH6FwsEUq6
 8VKQ==
X-Gm-Message-State: AOAM5324GH8sJqJHBdkZ9ZazSNqykyeUz6DBs1FoIpHH8fiizCs5kIDC
 67zyyoZYGrUCiR7YC0XmxKZh/EuxLfuILOd81QB6Pg==
X-Google-Smtp-Source: ABdhPJzIX1D5A8jNspVw0c+8pO7+J2Y3TXptE8qKOXAPqN0gaeFbQqIDm0YMXlOdZ4Pkwfk8Jr9NaDwBKVrbkRZCVGM=
X-Received: by 2002:a05:6000:229:: with SMTP id
 l9mr3446373wrz.43.1622908921436; 
 Sat, 05 Jun 2021 09:02:01 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 09:02:00 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <20210521122438.v2.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
References: <20210521122438.v2.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
 <20210521102500.12981-1-patrick.delaunay@foss.st.com>
Date: Sat, 5 Jun 2021 09:02:00 -0700
X-Google-Sender-Auth: qAxbRrelUKTwTo_Cu6JCdCmh7uI
Message-ID: <CAPnjgZ0gishWuN4Y15muW1UXwdhaTMp-o4bSnSUqprHoPi-GYg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@lists.denx.de, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] net: luton: remove address
	translation after ofnode_read_resource
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

Removed call of ofnode_translate_address() after ofnode_read_resource
in luton_switch.c:luton_probe(); it is unnecessary since
the commit feb7ac457c20 ("dm: core: Add address translation in
fdt_get_resource").

Fixes: feb7ac457c20 ("dm: core: Add address translation in fdt_get_resource")
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
Reported-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- Add reviewed-by

 drivers/net/mscc_eswitch/luton_switch.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
