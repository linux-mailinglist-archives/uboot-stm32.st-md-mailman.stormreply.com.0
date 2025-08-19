Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C939B2BFE6
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Aug 2025 13:10:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2824CC3F949;
	Tue, 19 Aug 2025 11:10:34 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58382C3F945
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 11:10:33 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c5n1f4VKDz9srM;
 Tue, 19 Aug 2025 13:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755601830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ6lItFyUG1+O3SSzAUpIZ/CURVejigGkmKlwmSfqaA=;
 b=fvw8HFRCs9Glzjt8OrxVx0XwpEhAo00y/WURGWsXSAr1mYon31FKhkvXH5W3MWXTzTb1cS
 0u4YElQPU1Gd94LAXKXk85RUCwySEwrqTKLwK/rhXVftQsN6ZPqmxvGVpa6TSiNS1pEJ+D
 RxXhmvgGmNoqnIPQJWwp5FEAoR/UfbJmUm21mgQCWCn9tervcbKwyOE0d5sQdL3BJC1Ax1
 UIM/VtU7IVWNDE+NUUtxG7wt5ROLnfrMCM9CHgZTWngYIqLB5C+JK0DbuAmnMK2bF+HEhk
 X1fcr84pXx9VDaSTGwtR9vIutJ7U/bNB0y0H2rIogI2/6SLVraopKJRpMgSpUQ==
Message-ID: <905b7b4b-a216-4bdc-868b-5b38efb61317@mailbox.org>
Date: Tue, 19 Aug 2025 13:10:23 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <827b1b5e-ac74-4710-8424-5bf0390441f6@mailbox.org>
 <9c805dc1-fc95-4d01-99cf-306264fd4b2b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <9c805dc1-fc95-4d01-99cf-306264fd4b2b@foss.st.com>
X-MBO-RS-META: 8t9wduq6jbmaqa9695chgspthzqampuu
X-MBO-RS-ID: 129ef360455819f3eec
Cc: Tom Rini <trini@konsulko.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Alexander Dahl <ada@thorsis.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 John Watts <contact@jookia.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Stefan Roese <sr@denx.de>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp2: Add SPI flashes support
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

T24gOC8xMy8yNSAxMDo1MyBBTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDgv
OC8yNSAxNzoyNCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDgvOC8yNSA1OjExIFBNLCBQYXRy
aWNlIENob3RhcmQgd3JvdGU6Cj4+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIDIgbmV3IGRyaXZl
cnM6Cj4+PiAgwqDCoCBfIFNUTTMyIE9jdG8gTWVtb3J5IE1hbmFnZXIgZHJpdmVyCj4+PiAgwqDC
oCBfIFNUTTMyIE9TUEkgZHJpdmVyCj4+Pgo+Pj4gSXQgYWRkcyByZXNvdXJjZSBjaGVjayBoZWxw
ZXJzIHdoaWNoIGFyZSB1c2VkIGJ5IE9NTSBkcml2ZXIuCj4+PiBJdCBhZGRzIGFuZCBlbmFibGVz
IE9NTSBhbmQgT1NQSSBkcml2ZXIgc3VwcG9ydCBmb3Igc3RtMzJtcDI1N2YtZXYxIGJvYXJkCj4+
IENhbiBJIHRlc3QgdGhpcyB3aXRoIG1haW5saW5lIFRGQSBhbmQgbWFpbmxpbmUgT3BUZWUtT1Mg
Pwo+IAo+IEhpIE1hcmVrCj4gCj4gQ3VycmVudGx5LCBpdCBtaXNzZXMgcmVndWxhdG9yIHN1cHBv
cnQgaW4gT1BURUUuCj4gQnV0IHlvdSBjYW4gZW5hYmxlICJtYW51YWxseSIgVkRESU8zIGFuZCBW
RERJTzQgaW4gVS1Cb290IGNvbnNvbGUKQWN0dWFsbHksIEkgbmVlZCB0byBlbmFibGUgVkRESU8z
LzQgZXZlbiBlYXJsaWVyLCBvdGhlcndpc2UgSSBnZXQgbm8gClVBUlQgYW5kIG5vIEkyQywgc28g
dGhhdCdzIG5vdCBhIHByb2JsZW0uIFZERElPMy80IGhhbmRsaW5nIHNlZW1zIHRvIGJlIApicm9r
ZW4gaW4gdGhlIFNUIGRvd25zdHJlYW0gVEZBIHdpdGggYWxtb3N0IDEwMDAgcGF0Y2hlcyBvbiB0
b3Agb2Ygb2xkIAp2ZXJzaW9uIG9mIFRGQSwgYW5kIHVwc3RyZWFtIFRGQSBmb3IgU1RNMzJNUDI1
eHggaXMgZW50aXJlbHkgYmFyZSBib25lcyAKdGhhdCBpdCBiYXJlbHkgd29ya3MuCgpJIGFsc28g
ZGlkbid0IG1hbmFnZSB0byBzdGFydCB1cHN0cmVhbSBVLUJvb3Qgb24gU1RNMzJNUDI1eHggYXQg
YWxsIHlldCwgCkkgc3RpbGwgaGF2ZSB0byB1cHBvcnQgYWJvdXQgNDAwIHBhdGNoZXMgKHJlZHVj
ZWQgZnJvbSBzb21lIDgwMCBmcm9tIFNUIApkb3duc3RyZWFtIG9sZCBVLUJvb3QgZm9yayksIGFu
ZCB0aGUgcmVzdWx0IHdvbid0IHdvcmsgdW5sZXNzIEkgdXNlIHRoZSAKb2Jzb2xldGUgU1QgZG93
bnN0cmVhbSBPcFRlZS1PUyA0LjAgZm9yayB3aXRoIGFsbW9zdCAxNzAwIHBhdGNoZXMgb24gdG9w
LgoKTWF5YmUgdGhlIHVwc3RyZWFtIE9wVGVlLU9TIGlzIG1pc3Npbmcgc29tZXRoaW5nLCBsaWtl
IHRoZSBlbnRpcmUgU0NNSSAKaW1wbGVtZW50YXRpb24gPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
