Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B878AAE44
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:15:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F25D4C6DD72;
	Fri, 19 Apr 2024 12:15:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F51C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:15:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J7tg74027245; Fri, 19 Apr 2024 14:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Hr7ZHTQzUsZB3ySGO7CATEB1iwLEvn4qm7TONJoZFRU=; b=s7
 jtaVqqTD7nM5ZG5iYtDPnz/n+EDyWEdToBGIq/xg7c5FuKtHkKmlu39sX6mPIcHj
 VI4VRvh4FfliDc2HeYb5xbFrhvuzMlgbiQvXK0aBmavF6nWHMjDuVppNpiEZPQuX
 WjT7LyzXL+CkaudZSZ6WXgHPMHW0FGkCajka3eMqsl5S3Pzob1K7fjdszJpqr26B
 Nqb7U42xB4OJUQO0XGqV3YYm3hsHZ4imgbn0GR2hNbT+SMfHGP6OQpgaEXqWoRsg
 LQwjLiGIuwVpuo3GZBuYjEf4cT7M2tHplBAVZ06LC6edo5CWMQ4m+U3jr3ZmXM95
 QYbFIoLluGVok7fIuqig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m12915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:15:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68D5D4002D;
 Fri, 19 Apr 2024 14:15:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2DCC21A204;
 Fri, 19 Apr 2024 14:15:32 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:15:32 +0200
Message-ID: <6c95bb23-fe56-494e-94c2-20fe42031ad6@foss.st.com>
Date: Fri, 19 Apr 2024 14:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@foundries.io>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20240207141154.1.If0aa2d32c2ffde32ed1d87ab8a088db67bc2d25c@changeid>
 <CAL6CDMHrdnw1yZ6gB3ZQz-ivVERiMExnzfhPUjrLBC9-9dcFVg@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAL6CDMHrdnw1yZ6gB3ZQz-ivVERiMExnzfhPUjrLBC9-9dcFVg@mail.gmail.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: cmd_stm32prog: add dependencies
 with USB_GADGET_DOWNLOAD
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

CgpPbiAyLzcvMjQgMTY6NTksIElnb3IgT3Bhbml1ayB3cm90ZToKPiBPbiBXZWQsIEZlYiA3LCAy
MDI0IGF0IDI6MTLigK9QTSBQYXRyaWNrIERlbGF1bmF5Cj4gPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+IHdyb3RlOgo+Pgo+PiBUaGlzIHBhdGNoIGF2b2lkcyBjb21waWxhdGlvbiBpc3N1
ZSB3aGVuIENPTkZJR19VU0JfR0FER0VUIGlzIGRlYWN0aXZhdGVkCj4+IGluIGRlZmNvbmZpZywg
d2l0aCB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIHJ1bl91c2JfZG5sX2dhZGdldCBhbmQgdG8KPj4g
Z19kbmxfc2V0X3Byb2R1Y3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkg
PHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiAgYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvS2NvbmZpZyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAv
Y21kX3N0bTMycHJvZy9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnBy
b2cvS2NvbmZpZwo+PiBpbmRleCA4ZjkxZGI0YjQ2YjkuLjU4OTI3NjI4MmU0NCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvS2NvbmZpZwo+PiArKysg
Yi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9LY29uZmlnCj4+IEBAIC0xNyw2
ICsxNyw3IEBAIGNvbmZpZyBDTURfU1RNMzJQUk9HCj4+ICBjb25maWcgQ01EX1NUTTMyUFJPR19V
U0IKPj4gICAgICAgICBib29sICJzdXBwb3J0IHN0bTMycHJvZyBvdmVyIFVTQiIKPj4gICAgICAg
ICBkZXBlbmRzIG9uIENNRF9TVE0zMlBST0cKPj4gKyAgICAgICBkZXBlbmRzIG9uIFVTQl9HQURH
RVRfRE9XTkxPQUQKPj4gICAgICAgICBkZWZhdWx0IHkKPj4gICAgICAgICBoZWxwCj4+ICAgICAg
ICAgICAgICAgICBhY3RpdmF0ZSB0aGUgY29tbWFuZCAic3RtMzJwcm9nIHVzYiIgZm9yIFNUTTMy
TVAgc29jIGZhbWlseQo+PiAtLQo+PiAyLjI1LjEKPj4KPiAKPiBSZXZpZXdlZC1ieTogSWdvciBP
cGFuaXVrIDxpZ29yLm9wYW5pdWtAZm91bmRyaWVzLmlvPgoKQXBwbGllZCBvbiB1LWJvb3Qtc3Rt
MzIvbWFzdGVyIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
