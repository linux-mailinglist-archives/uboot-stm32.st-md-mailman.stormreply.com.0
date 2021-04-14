Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0635F5C6
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Apr 2021 16:08:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E90E4C57B76;
	Wed, 14 Apr 2021 14:08:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FE46C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 14:07:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EE0UA8031576; Wed, 14 Apr 2021 16:07:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pYoyhA6jSmlS5U2bCidZ0PvYs96PDi0k4udzcLGSJKI=;
 b=jomZ522jbxrF3n9+U51YdkgYg66/L/LST2vaoyzZ7K+qwa7xdLOjRy6L3ETHMsyZ0FlR
 yJQbKEvI6Hx3tWlPuIbLGVvRQPFt9nbCMaxXxGnCU/72QMw5O1QB0PeVfqDCmn5YBmSu
 MisSOHuGN+dmSNguXKsZVmFrFo2ePHLKxegTwTst/43yvfCqY4MgPhoiYMzbAPKd5XpO
 XXnaEODMcs/zil6kRUCbJrhJX77hnSGFbB1zfekK+/sYX9iHkdxJKYYAQzA31NNnEmOD
 H6Wn15V4t//v6C+3xc7YUmiLxhtc1dHaK2JarQd4Dd8VzVZAr1QwO1DXLAiRkHaU90RJ hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37wrbpusf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:07:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C26B710002A;
 Wed, 14 Apr 2021 16:07:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACA72241862;
 Wed, 14 Apr 2021 16:07:48 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 16:07:48 +0200
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
 <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
Date: Wed, 14 Apr 2021 16:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Stephen Warren <swarren@nvidia.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device
 tree configuration for reset delay
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

SGksCgpPbiA0LzkvMjEgMjoyMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNC85LzIxIDEw
OjAwIEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBUaGUgZ3BpbyByZXNldCBhc3NlcnQv
ZGVhc3NlcnQgZGVsYXkgYXJlIHRvZGF5IGhhcmNvZGVkIGluIFUtQm9vdCBkcml2ZXIKPj4gYnV0
IHRoZSB2YWx1ZSBzaG91bGQgYmUgcmVhZCBmcm9tIERULgo+Pgo+PiBTVE0zMiB1c2UgdGhlIGdl
bmVyaWMgYmluZGluZyBkZWZpbmVkIGluIGxpbnV4Ogo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L2V0aGVybmV0LXBoeS55YW1sCj4+Cj4+IMKgwqAgcmVzZXQtZ3Bpb3M6
Cj4+IMKgwqDCoMKgIG1heEl0ZW1zOiAxCj4+IMKgwqDCoMKgIGRlc2NyaXB0aW9uOgo+PiDCoMKg
wqDCoMKgwqAgVGhlIEdQSU8gcGhhbmRsZSBhbmQgc3BlY2lmaWVyIGZvciB0aGUgUEhZIHJlc2V0
IHNpZ25hbC4KPj4KPj4gwqDCoCByZXNldC1hc3NlcnQtdXM6Cj4+IMKgwqDCoMKgIGRlc2NyaXB0
aW9uOgo+PiDCoMKgwqDCoMKgwqAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBhc3NlcnRlZCBp
biBtaWNyb3NlY29uZHMuIElmIHRoaXMKPj4gwqDCoMKgwqDCoMKgIHByb3BlcnR5IGlzIG1pc3Np
bmcgdGhlIGRlbGF5IHdpbGwgYmUgc2tpcHBlZC4KPj4KPj4gwqDCoCByZXNldC1kZWFzc2VydC11
czoKPj4gwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4+IMKgwqDCoMKgwqDCoCBEZWxheSBhZnRlciB0
aGUgcmVzZXQgd2FzIGRlYXNzZXJ0ZWQgaW4gbWljcm9zZWNvbmRzLiBJZgo+PiDCoMKgwqDCoMKg
wqAgdGhpcyBwcm9wZXJ0eSBpcyBtaXNzaW5nIHRoZSBkZWxheSB3aWxsIGJlIHNraXBwZWQuCj4+
Cj4+IFNlZSBhbHNvIFUtQm9vdDogZG9jL2RldmljZS10cmVlLWJpbmRpbmdzL25ldC9waHkudHh0
Cj4KPiBTaW5jZSB0aGlzIGlzIGEgUEhZIHByb3BlcnR5LCBzaG91bGRuJ3QgdGhhdCBiZSBoYW5k
bGVkIGluIAo+IGRyaXZlcnMvbmV0L3BoeS8gaW5zdGVhZCBvZiBNQUMgZHJpdmVyID8KCgpJIHdh
cyBteSBmaXJzdCBpZGVhIGJ1dCBJIGRvbid0IGZvdW5kIGZvdW5kIHRoZSBjb3JyZWN0IGxvY2F0
aW9uIGluIHBoeSAKKGRyaXZlciBvciB1Y2xhc3MpCgp0byBtYW5hZ2UgdGhlc2UgZ2VuZXJpYyBw
cm9wZXJ0eSBhbmQgdGhlIGdlbmVyaWMgcHJvcGVydHkgInJlc2V0LWdwaW9zIiAKd2FzIGFscmVh
ZHkKCm1hbmFnZWQgaW4gZXRoIGRyaXZlciwgc28gSSBjb250aW51ZSB0byBwYXRjaCB0aGUgZHJp
dmVyLgoKCkJ1dCBJIGNvbWUgYmFjayB0byB0aGlzIGlkZWEgYWZ0ZXIgeW91ciByZW1hcmsuLi4u
Cgo9PiBpbiBsaW51eCB0aGVzZSBwcm9wZXJ0eSBhcmUgbWFuYWdlZCBpbgoKIMKgwqDCoCBkcml2
ZXJzL25ldC9tZGlvL29mX21kaW8uYzo6b2ZfbWRpb2J1c19waHlfZGV2aWNlX3JlZ2lzdGVyCgog
wqDCoMKgIMKgwqDCoCBwYXJzZSBEVCBub2RlIGFuZCBhZGQgaW5mbyBpbiBtZGlvCgogwqDCoMKg
IGRyaXZlcnMvbmV0L3BoeS9tZGlvX2RldmljZS5jOjptZGlvX2RldmljZV9yZXNldAoKIMKgwqDC
oCDCoMKgwqAgY2FsbGVkIGluwqAgbWRpb19wcm9iZSAvIG1kaW9fcmVtb3ZlCgoKSW4gbXkgZmly
c3Qgc2VhcmNoLCBJIGRvbid0IGZvdW5kIHRoZSBzYW1lIGxldmVsIGluIHRoZSBVLUJvb3QgZHJp
dmVycyAKaW4gZHJpdmVycy9uZXQvcGh5LwoKYnV0IEkgbWlzcyB0aGUgdWNsYXNzIGRlZmluZWQg
aW4gZHJpdmVycy9uZXQvZXRoLXBoeS11Y2xhc3MuYwoKCkZpbmFsbHkgSSB0aGluayBJIG5lZWQg
dG8gbWFuYWdlIHRoZSBnZW5lcmljIGJpbmRpbmcgcHJvcGVydHkKCihyZXNldC1ncGlvcywgcmVz
ZXQtYXNzZXJ0LXVzLCByZXNldC1kZWFzc2VydC11cykgZGlyZWN0bHnCoCBpbgoKPT4gZHJpdmVy
cy9uZXQvbWRpby11Y2xhc3MKCgpUaGUgR1BJTyBSRVNFVCB3aWxsIGJlIG1hbmFnZWQgaW4gbWRp
b8KgIG9wczogcHJlX3Byb2JlLyBwb3N0X3JlbW92ZQoKYXMgaXQgaXMgZG9uZSBpbiBsaW51eAoK
d2FybmluZzogdG9kYXkgcG9zdF9yZW1vdmUgb3BzIGRvbid0IGV4aXQgaW4gdS1jbGFzcy4KCgpE
byB5b3UgdGhpbmsgaXQgaXMgdGhlIGNvcnJlY3QgbG9jYXRpb24gPwoKCkRvIHlvdSB0aGluayBp
dCBzaG91bGQgYmUgYSBuZXcgc2VyaWUgKG1pZ3JhdGUgdGhlIGVxb3MgcHJvcGVydHkgaW4gbWRp
bykKCmFmdGVyIHRoaXMgZXFvcyBpcyBhY2NlcHRlZAoKb3IgSSBzaG91ZGwgc2VudCBhIG5ldyBz
ZXJpZSB0byByZXBsYWNlIHRoaXMgc2VyaWUuCgoKUmVnYXJkcwoKClBhdHJpY2sKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
