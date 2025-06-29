Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C61AED039
	for <lists+uboot-stm32@lfdr.de>; Sun, 29 Jun 2025 22:08:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C664EC36B35;
	Sun, 29 Jun 2025 20:08:45 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5D46C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 20:08:44 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bVgNB2Ngrz9srp;
 Sun, 29 Jun 2025 22:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751227722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LATyC7JeMakEo4tNszjvqMeJ5k6SmlijeyKlIndIqE=;
 b=FsuDqGoC9zfK7Vnlk5Qx6SIra41Fm8RPI2fBHL7WVUEKWuUBe19LGKR6XmcQQdEbktr6FV
 v8wu0KUq3tBFjjVhMqK21gVxplwOhHBQVFDmYIGXyxyHkeYTvzgFGT1XsIZAqOBHdmE5bn
 1wwurcnXt2Tsyi4XXHBQSa4+QW2Y1vi+TejwaAGzKC6fouyFPl8xap2DQYjOk7Vq6PHEqc
 lxEUpA5O7JocHFMf9KHQ3wt120/ersZXkwpb+7PLHcrNrwZkzBHogmMW2Clkw7npZ+kHMp
 9uG6PpGPXlAJXTWN+OD8EOvi1H1mTx2mnDeoVaITQKW+DYe7doDgPNqMojDLMg==
Message-ID: <4c1d60c4-26fb-40eb-9855-56ca91776acb@mailbox.org>
Date: Sun, 29 Jun 2025 22:08:39 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-10-marek.vasut@mailbox.org>
 <89a5867f-996f-42e7-9e0e-544bec2fe457@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <89a5867f-996f-42e7-9e0e-544bec2fe457@foss.st.com>
X-MBO-RS-ID: c1b805d3a5b68a34aff
X-MBO-RS-META: ezwzuf36bwxwpum4ud4gabyegfy5sabu
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 09/10] ARM: dts: stm32: Add SPL specifics
 for DH STM32MP13xx DHCOR DHSBC
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gNi8zLzI1IDQ6MzYgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6CgpIaSwKCj4+ICsmZXR6
cGMgewo+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+ICt9Owo+PiArCj4g
Cj4gY2hhbmdlIHRoZSBjb21wYXRpYmxlIGlzIG5vdCBub3QgbmVlZGVkIEkgdGhpbmsKPiAKPiBp
ZiB0aGUgRVRaUEMgZHJpdmVyIHdhcyBub3QgY29tcGlsZWQgZm9yIFNQTAo+IAo+IHRvZGF5IGl0
IGlzIGNvbXBpbGVkCj4gCj4gIMKgLi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvZXR6
cGMuYwo+IAo+IC4vYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL01ha2VmaWxlOjc6b2Jq
LXkgKz0gZXR6cGMubwoKSSBuZWVkIHRvIGJlIGFibGUgdG8gYmluZCBkZXZpY2VzIG9uIHRoZSBl
dHpwYyBidXMsIHNvIGl0IHJlYWxseSBoYXMgdG8gCmJlIGEgc2ltcGxlLWJ1cyAuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
