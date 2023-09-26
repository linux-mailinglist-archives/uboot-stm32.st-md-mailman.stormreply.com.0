Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B377AE85E
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 10:54:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA37C6A5F2;
	Tue, 26 Sep 2023 08:54:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AA42C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 08:54:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38Q75ZaO012495; Tue, 26 Sep 2023 10:54:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=riAp4p5kbpCUt5pdp91OFS9QH58mWQiyGHZkUed/GXU=; b=vx
 0xtBIKtxl1uDT+AY5cxMq+QjldmBH1wUthrWCBip1ZhD7NDCBnkbamwwNOjDcUga
 uGTlEmP34JW5/QL57SLgthWKIYAoVU9IofEoVsCbMC2Wop6RmyDc8zpC64XeNMHu
 mzPCb7TD1+kSVasBxYZFEZccC0rXh0Dhn6xJBg6Z0F0jT9OzIk2aqrItDFpK4xW5
 GW429qZFfklItzjjL5kbcJ14gTtBv8+Y+tEobe3XrlTJxsAY5LFYdG8aIzKbf9rL
 jDE9HFwrwpZzXhRbOa/Aafnx4lqhtPpxJmWlGRW85Kf7Ymsl1dv/I2FtEos2XTq/
 w62I4o+DWOEjHzGwkvWw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9n54c4qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:54:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2C8A10005A;
 Tue, 26 Sep 2023 10:54:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBFD422A6CB;
 Tue, 26 Sep 2023 10:54:45 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:54:45 +0200
Message-ID: <a614f281-0b1f-eab7-a82c-4e9d2502f265@foss.st.com>
Date: Tue, 26 Sep 2023 10:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-9-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-9-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 08/10] ARM: dts: stm32: add pin map for
	LTDC on stm32f7
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

CgpPbiA5LzMvMjMgMjI6NDgsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IGNvbW1pdCBiYTI4N2Qx
YTAxMzc3MDJhMjI0YjFmNDg2NzNkNTI5MjU3YjNjNGJmIExpbnV4IHVwc3RyZWFtLgo+IAo+IEFk
ZCBwaW4gY29uZmlndXJhdGlvbnMgZm9yIHVzaW5nIExUREMgKExDRC10ZnQgRGlzcGxheSBDb250
cm9sbGVyKSBvbgo+IHN0bTMyZjc0Ni1kaXNjbyBib2FyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Mu
c3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20+Cj4gLS0tCj4gCj4gIGFyY2gvYXJtL2R0cy9zdG0zMmY3LXBpbmN0cmwu
ZHRzaSB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDM0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMy
ZjctcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMyZjctcGluY3RybC5kdHNpCj4gaW5k
ZXggNjA3ZmU0MmY0ZjQ2Li5kMzcwNmVlMzNiNWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vZHRz
L3N0bTMyZjctcGluY3RybC5kdHNpCj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMyZjctcGluY3Ry
bC5kdHNpCj4gQEAgLTM3Niw2ICszNzYsNDAgQEAKPiAgCQkJCQliaWFzLXB1bGwtdXA7Cj4gIAkJ
CQl9Owo+ICAJCQl9Owo+ICsKPiArCQkJbHRkY19waW5zX2E6IGx0ZGMtMCB7Cj4gKwkJCQlwaW5z
IHsKPiArCQkJCQlwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdFJywgNCwgQUYxNCk+LCAvKiBMQ0Rf
QjAgKi8KPiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0cnLDEyLCBBRjkpPiwgIC8qIExDRF9CNCAq
Lwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSScsIDksIEFGMTQpPiwgLyogTENEX1ZTWU5DICov
Cj4gKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdJJywxMCwgQUYxNCk+LCAvKiBMQ0RfSFNZTkMgKi8K
PiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLDE0LCBBRjE0KT4sIC8qIExDRF9DTEsgKi8KPiAr
CQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0knLDE1LCBBRjE0KT4sIC8qIExDRF9SMCAqLwo+ICsJCQkJ
CQkgPFNUTTMyX1BJTk1VWCgnSicsIDAsIEFGMTQpPiwgLyogTENEX1IxICovCj4gKwkJCQkJCSA8
U1RNMzJfUElOTVVYKCdKJywgMSwgQUYxNCk+LCAvKiBMQ0RfUjIgKi8KPiArCQkJCQkJIDxTVE0z
Ml9QSU5NVVgoJ0onLCAyLCBBRjE0KT4sIC8qIExDRF9SMyAqLwo+ICsJCQkJCQkgPFNUTTMyX1BJ
Tk1VWCgnSicsIDMsIEFGMTQpPiwgLyogTENEX1I0ICovCj4gKwkJCQkJCSA8U1RNMzJfUElOTVVY
KCdKJywgNCwgQUYxNCk+LCAvKiBMQ0RfUjUgKi8KPiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0on
LCA1LCBBRjE0KT4sIC8qIExDRF9SNiAqLwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSicsIDYs
IEFGMTQpPiwgLyogTENEX1I3ICovCj4gKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywgNywgQUYx
NCk+LCAvKiBMQ0RfRzAgKi8KPiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLCA4LCBBRjE0KT4s
IC8qIExDRF9HMSAqLwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSicsIDksIEFGMTQpPiwgLyog
TENEX0cyICovCj4gKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxMCwgQUYxNCk+LCAvKiBMQ0Rf
RzMgKi8KPiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0onLDExLCBBRjE0KT4sIC8qIExDRF9HNCAq
Lwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSicsMTMsIEFGMTQpPiwgLyogTENEX0IxICovCj4g
KwkJCQkJCSA8U1RNMzJfUElOTVVYKCdKJywxNCwgQUYxNCk+LCAvKiBMQ0RfQjIgKi8KPiArCQkJ
CQkJIDxTVE0zMl9QSU5NVVgoJ0onLDE1LCBBRjE0KT4sIC8qIExDRF9CMyAqLwo+ICsJCQkJCQkg
PFNUTTMyX1BJTk1VWCgnSycsIDAsIEFGMTQpPiwgLyogTENEX0c1ICovCj4gKwkJCQkJCSA8U1RN
MzJfUElOTVVYKCdLJywgMSwgQUYxNCk+LCAvKiBMQ0RfRzYgKi8KPiArCQkJCQkJIDxTVE0zMl9Q
SU5NVVgoJ0snLCAyLCBBRjE0KT4sIC8qIExDRF9HNyAqLwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1V
WCgnSycsIDQsIEFGMTQpPiwgLyogTENEX0I1ICovCj4gKwkJCQkJCSA8U1RNMzJfUElOTVVYKCdL
JywgNSwgQUYxNCk+LCAvKiBMQ0RfQjYgKi8KPiArCQkJCQkJIDxTVE0zMl9QSU5NVVgoJ0snLCA2
LCBBRjE0KT4sIC8qIExDRF9CNyAqLwo+ICsJCQkJCQkgPFNUTTMyX1BJTk1VWCgnSycsIDcsIEFG
MTQpPjsgLyogTENEX0RFICovCj4gKwkJCQkJc2xldy1yYXRlID0gPDI+Owo+ICsJCQkJfTsKPiAr
CQkJfTsKPiAgCQl9Owo+ICAJfTsKPiAgfTsKUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
