Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB02CF5A6F
	for <lists+uboot-stm32@lfdr.de>; Mon, 05 Jan 2026 22:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B25C5A4DB;
	Mon,  5 Jan 2026 21:22:32 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E77C5A4CA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 21:22:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlS1c4fPVz9tRH;
 Mon,  5 Jan 2026 22:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767648148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffsxHHAYFpTvcyZckAXruY0WAaKny5nwI+zaRh+eAxc=;
 b=B7a7RDrRzN8ZigRVoEb0Na5r2APZXHRNjEtIGd0aLRJkrz48GlrZ0z9Db4jxoWaP1kAqpM
 U1sFQZ8duu8aZt2gkkIpT2XIGq6x0prZuNu0GDXLNRsu337k7LtxBZ4CAwM4QX2MbZJLKy
 2Ea9MWfaoMbrlsl4P05qWsNxqwF6EZei9zdqbQxt9A89l8XyD6Y7gRxdDdP8IWhBg+jkCs
 Aa7mwuq8iQKECP7ouFr7levt1zxia3PhiRnAPoQwSQW08R7iZCYX62EIhGCy52LvXs1V5b
 Nawf1QPMmhby/FXn8/QZopt2NW5dRrApXRH+awOaJpDnA77k5Zc65RTPEqQeaA==
Message-ID: <5a4ea825-3a89-4856-b9d8-d1df827f9b9c@mailbox.org>
Date: Mon, 5 Jan 2026 22:22:25 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
 <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
 <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
 <5f0174c7-6791-4fc3-80df-62812baed40c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5f0174c7-6791-4fc3-80df-62812baed40c@foss.st.com>
X-MBO-RS-ID: ad41856f0f562ad68a1
X-MBO-RS-META: qusfn1d9uni66as1jwsugdtuiyetffwt
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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

T24gMS81LzI2IDM6MzAgUE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKCkhlbGxvIFBhdHJpY2Us
Cgo+Pj4+PiAgwqDCoMKgwqDCoCAvKiBXV0RHICovCj4+Pj4+IC3CoMKgwqAgU1RNMzJfR0FURShD
S19CVVNfV1dERzEsICJja19pY25fcF93d2RnMSIsICJja19pY25fYXBiMyIsIDAsIEdBVEVfV1dE
RzEsCj4+Pj4+ICvCoMKgwqAgU1RNMzJfR0FURShDS19CVVNfV1dERzEsICJja19pY25fcF93d2Rn
MSIsIElEWF9JQ05fQVBCMywgMCwgR0FURV9XV0RHMSwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBTRUNfUklGU0MoMTAzKSksCj4+Pj4+IC3CoMKgwqAgU1RNMzJfR0FURShDS19CVVNf
V1dERzIsICJja19pY25fcF93d2RnMiIsICJja19pY25fbHNfbWN1IiwgMCwgR0FURV9XV0RHMiwK
Pj4+Pj4gK8KgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RHMiwgImNrX2ljbl9wX3d3ZGcyIiwg
SURYX0lDTl9MU19NQ1UsIDAsIEdBVEVfV1dERzIsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU0VDX1JJRlNDKDEwNCkpLAo+Pj4+PiAgwqAgfTsKPj4+Pj4gICAKPj4+PiBIaSBNYXJl
awo+Pj4+Cj4+Pj4gQ2FuIHlvdSBnaXZlIHRoaXMgcGF0Y2hzZXQgYSB0cnkgb24gREhDT1IgYm9h
cmQgaW4gU1BMID8KPj4+IEkgaGF2ZSBiYWQgbmV3cywgdGhlIFNQTCBkb2VzIG5vdCBldmVuIHN0
YXJ0IHdpdGggdGhpcywgbm8gb3V0cHV0IG9uIFVBUlQgZXZlbi4gVGhlIHByb2JsZW0gc2VlbXMg
dG8gYmUgaW4gMy8zICwgaWYgSSBhcHBseSBvbmx5IDEvMyBhbmQgMi8zIHRoZSBib2FyZCBkb2Vz
IGJvb3QganVzdCBmaW5lLgo+IAo+IEhpIE1hcmVrCj4gCj4gSGFwcHkgbmV3IHllYXIgOy0pCgpU
aGFuayB5b3UsIEhhcHB5IE5ldyBZZWFyIHRvIHlvdSB0b28uCgo+IEhhdmUgeW91IHRyaWVkIHdp
dGggREVCVUdfVUFSVCA/CgpObywgdGhhdCBpcyBub3QgZW5hYmxlZCBpbiB0aGUgREhTQkMgY29u
ZmlnLgoKWW91IHNob3VsZCBiZSBhYmxlIHRvIHRyeSB0aGUgU1BMIG9uIE1QMTMgRVYgaWYgeW91
IHBpY2sgdGhlIGNoYW5nZXMgCmZyb20gdGhlc2UgdGhyZWUgY29tbWl0cyAoYSBmZXcgRFQgY2hh
bmdlcyBhbmQgYSBmZXcgY29uZmlnIG9wdGlvbnMpLCBpdCAKc2hvdWxkIGJlIHN0cmFpZ2h0Zm9y
d2FyZCB0byBwb3J0IG92ZXIgYW5kIGhlbHAgeW91IGRlYnVnIHRoZSBwcm9ibGVtOgoKYmY1MzM0
NGJmZjhkICgiQVJNOiBkdHM6IHN0bTMyOiBBZGQgU1RNMzJNUDEzeCBTUEwgc3BlY2lmaWMgRFQg
YWRkaXRpb25zIikKMTE0M2ZkNGMzNTA3ICgiQVJNOiBkdHM6IHN0bTMyOiBBZGQgU1BMIHNwZWNp
ZmljcyBmb3IgREggU1RNMzJNUDEzeHggCkRIQ09SIERIU0JDIikKOTk4ZGE2OWRhNjc4ICgiQVJN
OiBkdHM6IHN0bTMyOiBTd2l0Y2ggZGVmY29uZmlnIHRvIFNQTCBmb3IgREggClNUTTMyTVAxM3h4
IERIQ09SIERIU0JDIikKCklmIHRoaXMgZG9lc24ndCB3b3JrIHF1aWNrbHkgZm9yIHlvdSwgSSBj
YW4gdHJ5IHRvIHNldCB1cCB0aGUgTVAxMyBESFNCQyAKd2l0aCBERUJVR19VQVJUIGxhdGVyIHRo
aXMgd2Vlay4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK
