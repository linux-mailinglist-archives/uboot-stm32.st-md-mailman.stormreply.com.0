Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C1C9AC443
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 11:21:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 008D7C71287;
	Wed, 23 Oct 2024 09:21:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CE79C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 09:21:29 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2e2e6a1042dso5186086a91.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729675288; x=1730280088;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rj9Cmv/yYarb016F0wFM+E7xyaUmVmz+1Vh6d3IMl24=;
 b=ixCYcg75lLqXZVVTBpg3pPksh/YHkWZI9CvnGfUOEUjDGxTLh950H4CewdXIZYUtWp
 J8mF29P3bqVd6/kzezVmcfn4at3OcT+rFvlkTmbywEVQ6g3GegqVQmDluiE4Sb5pFsdc
 6uOwyEEPwnoPj2Rnf3yO8ay+57XBQLxrxKeEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729675288; x=1730280088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rj9Cmv/yYarb016F0wFM+E7xyaUmVmz+1Vh6d3IMl24=;
 b=ISPrJLKT+0RlzuptiQI7QcuVvABKdZbOPGcJcIOnTQhSqcUYIxZ4MSGNPwyKAKuhOv
 vO4zCVtLAwAq/ohwVAfCMJnHXkZI92cmBsm46DYRw3fTAxqPWa8f8OGhojSGp+DFCsQj
 mb9WN17drHX2sA5Ndho0LcPaA5Qs5ga669HDURlN0gM7QPZVwTdmF/YR+iG8k2hNjwAM
 5/EZKR9VXAy65LHhS2pd6vEfaxiacLWxLLEtebLzbaYY8CBN4In6yTgt5X/Z/Lh/C+Dt
 IUqq6UUiGjc5ZyW40Igj7DQXBgtZCTaZjrtfQjLjUYRPnOgea9qlbHZgXyPobzcSiG7I
 Nwpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVTKuBuVSJM01KWW6eZFx6nuXOziE8cDuxNfTk66LEZC0+73iKs+pzcmAG9Mvg9iMZCIw2FZ+c4nYsBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiplzAWGAH7drYUi/bYF5dsnC7hQIFkq7CeYW8pVTpusPktjuG
 QbyWZuki4mHxwHYuUr0//Rsd0iaOSzJa5PTq/lfYscWs9+z8knAqB7v7RL1y0uYoDgz/1cDbqqe
 GTfQuP2arWJf//TOMCsGdYjRS1U9CaNxT9NE45g==
X-Google-Smtp-Source: AGHT+IGia+KgYes1xG+b5F13euMSxDwT3lliYBOf5EHydHBHNwdgd4v/z8uljQWoP1HmN6PSALoJ90EgeHuGgokpOG4=
X-Received: by 2002:a17:90b:4a0c:b0:2e2:ebbb:760c with SMTP id
 98e67ed59e1d1-2e76b5dd9f0mr1953792a91.11.1729675287933; Wed, 23 Oct 2024
 02:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
In-Reply-To: <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Oct 2024 11:21:17 +0200
Message-ID: <CAOf5uwkO+eYQx41HM9ydc1fRxjkhrytrtp1SLLKbotVNfk+KXw@mail.gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, "Abbarapu,
 Venkatesh" <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWsKCk9uIFdlZCwgT2N0IDIzLCAyMDI0IGF0IDEwOjQx4oCvQU0gTWFyZWsgVmFzdXQg
PG1hcmVrLnZhc3V0QG1haWxib3gub3JnPiB3cm90ZToKPgo+IE9uIDEwLzIzLzI0IDU6MTggQU0s
IEFiYmFyYXB1LCBWZW5rYXRlc2ggd3JvdGU6Cj4gPiBIaSBNYXJlaywKPiA+IFRoZXJlIHdhcyBz
b21lIGlzc3VlIGFuZCBmaXggaXMgc2VudAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1i
b290LzIwMjQxMDE4MDgyNjQ0LjIyNDk1LTEtdmVua2F0ZXNoLmFiYmFyYXB1QGFtZC5jb20vVC8j
dQo+Cj4gSXMgdGhpcyBvbmUgZml4IG9yIHRocmVlIGZpeGVzIGZvciB0aHJlZSBkaWZmZXJlbnQg
aXNzdWVzID8KPgo+IFRoaXMgc2VlbXMgdG8gZml4IFJFQUQgZXJyb3JzLCB3aGljaCBpcyBhcHBh
cmVudGx5IGFub3RoZXIgZXJyb3IKPiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc3R1ZmYuIEluIG15IGNh
c2UsIHBsYWluIGFuZCBzaW1wbHkgJ3NmIHByb2JlIDsgc2YKPiB1cGRhdGUnIGNvbWJpbmF0aW9u
IHdpdGggc2luZ2xlIG5vbi1zdGFja2VkIFNQSSBOT1IgZG9lcyBub3Qgd29yay4gV2FzCj4gc3Vj
aCBhIHNpbXBsZSBjb25maWd1cmF0aW9uIGV2ZXIgdGVzdGVkID8KPgo+ID4gTm90IHN1cmUgd2Ug
bmVlZCB0byByZXZlcnQgd2hvbGUgcGFyYWxsZWwvc3RhY2tlZCBzdXBwb3J0Pwo+IFBsZWFzZSBz
dG9wIHRvcC1wb3N0aW5nLgoKc3BpLW5vciB3YXMgdGFrZW4gY2FyZSBidXkgSmFnYW4gYnV0IEkg
ZG9udCcga25vdyBpZiBoZSBpcyBoYXZpbmcKdGltZS4gVGhpcyBzZXJpZXMgd2FzIG5vdCBtZXJn
ZWQgZnJvbSBvdXIKc2lkZQoKTWljaGFlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
