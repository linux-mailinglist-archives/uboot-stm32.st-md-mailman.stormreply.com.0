Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB083058F
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jan 2024 13:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E26C7C6DD74;
	Wed, 17 Jan 2024 12:39:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE20BC6DD6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 12:39:30 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50e741123acso13507490e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705495170; x=1706099970;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSz/1sJNsR8v/7aa7YHZEWyDdRaLeW1vD03f/0mKWk0=;
 b=a963IJfpXcT9HCW+r6X128mR+/r+IsevczYwkD4Rj/2UcU9n7iwxr28xKdoqH4ou6o
 mn3tcr/PlBf8EaWFBj2hiqfk7UE8KxvA9skTBK2yp2mDUOJEcYxORvqZeC8wKWZCmJWC
 agXBYk//OMwg1ZU4VHEzAvu/t6VZ6oSs4iP8ILsV9qX041TySxIL95cBcuvqC8MtrNWh
 g1aqBEWxEiCgzTpElQtfbkVlrLYmyqEs/n3YhcAMz015oaS/Tu+YjNwazSsoIvofhhtA
 sTZtwO0G1ublUTRkh2iUlAyPtuQC3AFgOjshI4Wo/zTvymUiuKYfKagLJBNLycRDt5FY
 z9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705495170; x=1706099970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSz/1sJNsR8v/7aa7YHZEWyDdRaLeW1vD03f/0mKWk0=;
 b=GiDytZbSG3u7HjUElckd98bezAgUtrQBCisoIp+bIShvhVMbbYzUULb5eYF50zIGrf
 onFAGR+crdzJFqPmuqOAR3ictGHZA8yixrxTecDyOtW1CzKx7eGdqwvx1dVCqZP+u48C
 PDc6UhemfNd1Vwv/B108H5Gc8BTaZ+WDB1RSGHbOi3TWfxwmaLRZbVtj1kluLw2VZkp7
 YmSXuQSVdeiE+2y0VI7btHoBePQH8GT5N+zNQ+HcgceDpCuZFuqpZ95vL9pkdR/yeX/e
 jcLo2HFZ1RwQ5GN32DiZVRr6Be4kLXiOIRP2KKfdSEjZBZQrPgvD4KAJ2aVSz3lbWOSB
 Jm7w==
X-Gm-Message-State: AOJu0Yy+RqcEdKaxsGXXmhXAgpqtdISFk9YIdbP/VWrqV0tkiTEe3eW8
 BhSOo/by9xNaBlYo+lvmeN0cKCN1oYhdMzj3viM=
X-Google-Smtp-Source: AGHT+IHpjk6qWyhy5gbaJwXxZZREI7/76JaD1y2ZqkZmJ5z+w26S/uZJNwq0NJ9xKEHbI7c8V7B5mjoZkkIzIcuw8Jk=
X-Received: by 2002:ac2:4d1a:0:b0:50e:e420:65eb with SMTP id
 r26-20020ac24d1a000000b0050ee42065ebmr3559240lfi.128.1705495169658; Wed, 17
 Jan 2024 04:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20240117123714.50380-1-patrice.chotard@foss.st.com>
In-Reply-To: <20240117123714.50380-1-patrice.chotard@foss.st.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 17 Jan 2024 20:39:17 +0800
Message-ID: <CAEUhbmXCaduJq174B5OPRcM=rEHq23CqXEMnU-hTmPNGKiwyyQ@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Bin Meng <bmeng@tinylab.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ion Agorria <ion@agorria.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] common: console: Fix print complete
	stdio device list
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgODozN+KAr1BNIFBhdHJpY2UgQ2hvdGFyZAo8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEluIGNhc2UgQ09OU09MRV9NVVggYW5k
IFNZU19DT05TT0xFX0lTX0lOX0VOViBhcmUgb24gYW5kCj4gc3RkaW4gb3Igc3Rkb3V0IG9yIHN0
ZGVyciBhcmUgbWlzc2luZyBpbiBlbnZpcm9ubWVudCwgYXMgZmFsbGJhY2ssIGdldAo+IHRoZXNl
IGVpdGhlciBmcm9tIHN0ZGlvX2RldmljZXNbc3RkXSBvciBzdGRpb19kZXZpY2VzW3N0ZF0tPm5h
bWUuCj4KPiBGaXhlczogNmIzNDNhYjM4ZCAoImNvbnNvbGU6IFByaW50IG91dCBjb21wbGV0ZSBz
dGRpbyBkZXZpY2UgbGlzdCIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAg
IC0gc2ltcGxpZnkgY29kZSBzdWdnZXN0ZWQgYnkgQmluIE1lbmcKPgo+ICBjb21tb24vY29uc29s
ZS5jIHwgMjcgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IEJpbiBNZW5n
IDxibWVuZy5jbkBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
