Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63103C2249
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 12:35:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 572A6CFAC5A;
	Fri,  9 Jul 2021 10:35:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98376C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 10:35:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169AHAc2010264; Fri, 9 Jul 2021 12:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PEJCJhXYNouVv1mkVx8IBG2537g+m50AWjKdvgXkdPU=;
 b=Tgb5So3ul0qoof23NcgBBD//nAS32BYigCguZg3Y/UdHwuT38rKpTrc4vIj+70e6rAQa
 zY7/+Tkyr3pYRDsufYa387hyI2MsKAs/Ls8HTzYcBgs9XhmKP5hzJsJ04RtAN5TR+76e
 uqDNft2Ca6oVTBBbA5jVxtBoObrTxjWDZhLnKh5uAOnroMzrgfsp6G2BZFUU44a0/Avx
 yq7MtlLyZwv4SWqIYBN4ykRWac71ScTJcau0pgn3Ix788hkjHsSW23dUxmnz1V2Z4q5s
 lfKJPVA77SITyZuZfsV5hhKyKcCdPEd6JRF4WAxm9+pQiEriqEKibGRtN09I70iBFr1z jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbcca2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:35:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD47210002A;
 Fri,  9 Jul 2021 12:35:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9B7021E678;
 Fri,  9 Jul 2021 12:35:46 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 12:35:46 +0200
To: <u-boot@lists.denx.de>, Ramon Fried <rfried.dev@gmail.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <856dc613-018c-20a2-99ac-b602678aa922@foss.st.com>
Date: Fri, 9 Jul 2021 12:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_04:2021-07-09,
 2021-07-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/6] net: dwc_eth_qos: add support of
 device tree configuration for reset delay
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

SGkgUmFtb24sCgpPbiA0LzI2LzIxIDU6NDYgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4g
SXQgaXMgdGhlIFYyIHZlcnNpb24gb2YgWzFdIGFmdGVyIE1hcmVrIHJlbWFya3M6IGFsbCBjb21t
aXQgYXJlIG5ldy4KPgo+IEkgY2hhbmdlIHRoZSBEV0NfRVRIX1FPUyBTVE0zMiB2YXJpYW50IGJ5
IHVzaW5nIGdlbmVyaWMgZXRoIHBoeSBkcml2ZXIuCj4KPiBUaGlzIGRyaXZlciBpcyB1cGRhdGVk
IHRvIHVzZSB0aGUgZ3BpbyByZXNldCBhbmQgYXNzZXJ0L2RlYXNzZXJ0IGRlbGF5Cj4gZnJvbSBE
VCB3aXRoIHRoZSBnZW5lcmljIGJpbmRpbmcgZGVmaW5lZCBpbiBsaW51eDoKPiAgICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2V0aGVybmV0LXBoeS55YW1sCj4gb3IgaW4g
VS1Cb290OiBkb2MvZGV2aWNlLXRyZWUtYmluZGluZ3MvbmV0L3BoeS50eHQKPgo+IFsxXSBuZXQ6
IGR3Y19ldGhfcW9zOiBhZGQgc3VwcG9ydCBvZiBkZXZpY2UgdHJlZSBjb25maWd1cmF0aW9uIGZv
ciByZXNldCBkZWxheQo+ICAgICAgaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
dWJvb3QvbGlzdC8/c2VyaWVzPTIzODI1MyZzdGF0ZT0qCj4KPgo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBVcGRhdGUgZXRoLXBoeSBkcml2ZXIgKE5FVykKPiAtIHVzZSBsb2cgbWFjcm8gaW4gZXRoLXBo
eSBkcml2ZXIgKE5FVykKPiAtIHVwZGF0ZSBldGgtcGh5IGRyaXZlciB0byBzdXBwb3J0IFNUTTMy
IGJpbmRpbmcgd2l0aCBhIG1kaW8wIHN1Ym5vZGUgKE5FVykKPiAtIHJlbW92ZSB1bnVzZWQgZWxl
bWVudCBpbiB0aGUgc3RydWN0IGVxb3NfcHJpdiAoTkVXKQo+IC0gdXNlIGdlbmVyaWMgZXRoZXJu
ZXQgcGh5IGZvciBzdG0zMiB2YXJpYW50LCB0aGlzIHBhdGNoIGlzIGEgUkVXT1JLIG9mCj4gICAg
cHJldmlvdXMgc2VyaWU6IHRoZSBkZXZpY2UgcGFyc2luZyBpcyBkb25lIGluIGV0aC1waHkgZHJp
dmVyIGFuZCB0aGUgZ3Bpbwo+ICAgIHN1cHBvcnQgaXMgcmVtb3ZlZCBpbiBzdG0zMiB2YXJpYW50
OiBlcW9zX3N0YXJ0L3N0b3BfcmVzZXRzX3N0bTMyIGFuZAo+ICAgIGVxb3NfcHJvYmVfcmVzb3Vy
Y2VzX3N0bTMyLgo+IC0gY2xlYW51cCBvcHMgYnkgYWRkaW5nIGEgY29tbW9uIG51bGwgb3BzIChO
RVcpCj4KPiBQYXRyaWNrIERlbGF1bmF5ICg2KToKPiAgICBuZXQ6IGV0aC1waHk6IGFkZCBzdXBw
b3J0IG9mIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRpb24gZm9yIGdwaW8gcmVzZXQKPiAgICBuZXQ6
IGV0aC1waHk6IHVzZSBkZXZfZGJnIGFuZCBsb2dfbm90aWNlCj4gICAgbmV0OiBldGgtcGh5OiBt
YW5hZ2Ugc3Vibm9kZSBtZGlvMAo+ICAgIG5ldDogZHdjX2V0aF9xb3M6IHJlbW92ZSB0aGUgZmll
bGQgcGh5YWRkciBvZiB0aGUgc3RydWN0IGVxb3NfcHJpdgo+ICAgIG5ldDogZHdjX2V0aF9xb3M6
IHVzZSBnZW5lcmljIGV0aGVybmV0IHBoeSBmb3Igc3RtMzIgdmFyaWFudAo+ICAgIG5ldDogZHdj
OiBhZGQgYSBjb21tb24gZW1wdHkgb3BzIGVxb3NfbnVsbF9vcHMKPgo+ICAgZHJpdmVycy9uZXQv
S2NvbmZpZyAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL25ldC9kd2NfZXRoX3Fvcy5jICAg
IHwgMTUyICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL25l
dC9ldGgtcGh5LXVjbGFzcy5jIHwgIDc4ICsrKysrKysrKysrKysrKy0tLQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAxNDAgZGVsZXRpb25zKC0pCj4KClRoaXMgc2VyaWUg
aXMgYWxzbyBhY2NlcHRlZCBpbiBwYXRjaHdvcmsswqAgYnV0IG5vdCBtZXJnZWQgaW4gCnUtYm9v
dC1uZXQvbmV0d29ya19tYXN0ZXI6CgpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC91Ym9vdC9saXN0Lz9zZXJpZXM9MjQwODA4JnN0YXRlPSoKCkRvIHlvdSBwbGFuIHRvIGludGVn
cmF0ZSBpdCBpbiB5b3UgbmV4dCBwdWxsIHJlcXVlc3QgZm9yIHYyMDIxLjEwID8KCgpSZWdhcmRz
CgpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
