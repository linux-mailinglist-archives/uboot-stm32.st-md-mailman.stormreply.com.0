Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC6B2DD7C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Aug 2025 15:15:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15006C349C6;
	Wed, 20 Aug 2025 13:15:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95FA4C36B2D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 13:15:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KDEZbL027057;
 Wed, 20 Aug 2025 15:14:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3rNFkPolCW/dReZKXryMfEKmqMIZuqxiI7nsuTgSahM=; b=0ak2GKmD0Ix38Z+c
 YqLAh8teoCbpgWofLwXJpTV/OBInBLBm3v4wwzVEocbRatFaYfpWL+mMlaykaa7F
 mmMuhk0EyeLfVW5uiifpcWVxzXY+IndWEDnU2JmD0FQWlXWbFP2u6PuIli9bmAoz
 tzbzLIWE1KJmQbUoojD2aVo3sXn0Id6YTQE03n145HkNpFL5Sn0JHnAuu792bQCi
 YNEr9KcULgFesm++VT3rLN0RDar3FlpTyVNKD/1OGmh+dhYrNhDP9ECnrRZGYTNA
 o/UaHYo61Hs0fUobxNhYrb+ltm9JaifEOCjkojaytVaimiEhpvdqEPwfZf2hYXCg
 HuewUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70da5y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 15:14:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 91D2F40044;
 Wed, 20 Aug 2025 15:12:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F8AD6CD021;
 Wed, 20 Aug 2025 15:11:35 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 15:11:34 +0200
Message-ID: <d7d281a2-69c4-4bc3-8392-dd772f889a18@foss.st.com>
Date: Wed, 20 Aug 2025 15:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <827b1b5e-ac74-4710-8424-5bf0390441f6@mailbox.org>
 <9c805dc1-fc95-4d01-99cf-306264fd4b2b@foss.st.com>
 <905b7b4b-a216-4bdc-868b-5b38efb61317@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <905b7b4b-a216-4bdc-868b-5b38efb61317@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA4LzE5LzI1IDEzOjEwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA4LzEzLzI1IDEwOjUz
IEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDgvOC8yNSAxNzoyNCwgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA4LzgvMjUgNToxMSBQTSwgUGF0cmljZSBDaG90YXJkIHdy
b3RlOgo+Pj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgMiBuZXcgZHJpdmVyczoKPj4+PiDCoMKg
wqAgXyBTVE0zMiBPY3RvIE1lbW9yeSBNYW5hZ2VyIGRyaXZlcgo+Pj4+IMKgwqDCoCBfIFNUTTMy
IE9TUEkgZHJpdmVyCj4+Pj4KPj4+PiBJdCBhZGRzIHJlc291cmNlIGNoZWNrIGhlbHBlcnMgd2hp
Y2ggYXJlIHVzZWQgYnkgT01NIGRyaXZlci4KPj4+PiBJdCBhZGRzIGFuZCBlbmFibGVzIE9NTSBh
bmQgT1NQSSBkcml2ZXIgc3VwcG9ydCBmb3Igc3RtMzJtcDI1N2YtZXYxIGJvYXJkCj4+PiBDYW4g
SSB0ZXN0IHRoaXMgd2l0aCBtYWlubGluZSBURkEgYW5kIG1haW5saW5lIE9wVGVlLU9TID8KPj4K
Pj4gSGkgTWFyZWsKPj4KPj4gQ3VycmVudGx5LCBpdCBtaXNzZXMgcmVndWxhdG9yIHN1cHBvcnQg
aW4gT1BURUUuCj4+IEJ1dCB5b3UgY2FuIGVuYWJsZSAibWFudWFsbHkiIFZERElPMyBhbmQgVkRE
SU80IGluIFUtQm9vdCBjb25zb2xlCj4gQWN0dWFsbHksIEkgbmVlZCB0byBlbmFibGUgVkRESU8z
LzQgZXZlbiBlYXJsaWVyLCBvdGhlcndpc2UgSSBnZXQgbm8gVUFSVCBhbmQgbm8gSTJDLCBzbyB0
aGF0J3Mgbm90IGEgcHJvYmxlbS4gVkRESU8zLzQgaGFuZGxpbmcgc2VlbXMgdG8gYmUgYnJva2Vu
IGluIHRoZSBTVCBkb3duc3RyZWFtIFRGQSB3aXRoIGFsbW9zdCAxMDAwIHBhdGNoZXMgb24gdG9w
IG9mIG9sZCB2ZXJzaW9uIG9mIFRGQSwgYW5kIHVwc3RyZWFtIFRGQSBmb3IgU1RNMzJNUDI1eHgg
aXMgZW50aXJlbHkgYmFyZSBib25lcyB0aGF0IGl0IGJhcmVseSB3b3Jrcy4KPiAKPiBJIGFsc28g
ZGlkbid0IG1hbmFnZSB0byBzdGFydCB1cHN0cmVhbSBVLUJvb3Qgb24gU1RNMzJNUDI1eHggYXQg
YWxsIHlldCwgSSBzdGlsbCBoYXZlIHRvIHVwcG9ydCBhYm91dCA0MDAgcGF0Y2hlcyAocmVkdWNl
ZCBmcm9tIHNvbWUgODAwIGZyb20gU1QgZG93bnN0cmVhbSBvbGQgVS1Cb290IGZvcmspLCBhbmQg
dGhlIHJlc3VsdCB3b24ndCB3b3JrIHVubGVzcyBJIHVzZSB0aGUgb2Jzb2xldGUgU1QgZG93bnN0
cmVhbSBPcFRlZS1PUyA0LjAgZm9yayB3aXRoIGFsbW9zdCAxNzAwIHBhdGNoZXMgb24gdG9wLgo+
IAo+IE1heWJlIHRoZSB1cHN0cmVhbSBPcFRlZS1PUyBpcyBtaXNzaW5nIHNvbWV0aGluZywgbGlr
ZSB0aGUgZW50aXJlIFNDTUkgaW1wbGVtZW50YXRpb24gPwoKCkhpIE1hcmVrIAoKSWYgeW91IHJl
ZmVyIHRvIG15IHByZXZpb3VzIGUtbWFpbCB3aXRoIHRoZSBzdG0zMm1wMjU3Zi1ldjEgYm9vdCBs
b2csIAp3aXRoIHRoZSBmb2xsb3dpbmcgdXBzdHJlYW0gY29tcG9uZW50czoKClRGLUE6IHYyLjEz
LjAtMzA0LWcwMDBmZTIyMWI4Ck9QLVRFRTogNC43LjAtMjYtZzg0N2VlMjkzMgpVLUJvb3Q6IHYy
MDI1LjA3CgpJIGFtIGFibGUgdG8gYm9vdCBhIFNUTTMyTVAyNTdmLUVWMSBib2FyZC4KClBhdHJp
Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
