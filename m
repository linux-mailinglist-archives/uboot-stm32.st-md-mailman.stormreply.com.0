Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D389331878B
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Feb 2021 10:58:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94B16C57B52;
	Thu, 11 Feb 2021 09:58:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FE64C5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 09:58:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11B9p3F9022746; Thu, 11 Feb 2021 10:58:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gknKn6HawBn215F2wwyQKMNr/E94aHD12JUwwIEEn8I=;
 b=OUPQHSO9ICP/qx/9KRcqaclWLCfcPoXvrikv07M8NSsWfYmcrZUlZq2N4dqadX2DDO7s
 z4VNujXU4jDV3xj9OxPXP5mok7veHkfGNl7FPCOQnrHJlTszWz1eflx4HiTcnKKcfb77
 sAxuDtHpESbbcb1sXVaV5LP+B/bQzJzIcMk9VkCUjutZS8q85xTpXJg1dQuLKRu/oyAX
 snr6hmjoPiznVHSLAd76GKdJ40yx4/NBadxmCc3vr78skQqIktVJdagkvFtGka+g9f9H
 2cWo7gRbRpOAGrP/cfXAt1I5g5LcTCc2wRKFZrZrrOHEdhJZ8Tkm2F42Ai3ZxmO3IuTA lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2cnpew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 10:58:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5AF3100034;
 Thu, 11 Feb 2021 10:58:32 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD830221768;
 Thu, 11 Feb 2021 10:58:32 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.122) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Feb
 2021 10:58:32 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210210141759.5641-1-patrice.chotard@foss.st.com>
 <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <7b665909-b1d6-323c-f6a4-4221fca616c7@foss.st.com>
Date: Thu, 11 Feb 2021 10:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec67a889-1639-5652-2766-aeb0badb70d3@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_05:2021-02-10,
 2021-02-11 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: gadget: dwc2_udc_otg: Fix
	dwc2_gadget_start()
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

SGkgTWFyZWsKCk9uIDIvMTAvMjEgMzoyNiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMi8x
MC8yMSAzOjE3IFBNLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFNpbmNlIGNvbW1pdCA4NzQ1
YjllYmNjYWUgKCJ1c2I6IGdhZGdldDogYWRkIHN1cGVyIHNwZWVkIHN1cHBvcnQiKQo+PiB1bXMg
d2FzIG5vIG1vcmUgZnVuY3Rpb25hbCBvbiBwbGF0Zm9ybSB3aGljaCB1c2UgZHdjMl91ZGNfb3Rn
IGRyaXZlci4KPj4KPj4gUmVtb3ZlIHRoZSBzcGVlZCB0ZXN0IGluIGR3YzJfZ2FkZ2V0X3N0YXJ0
KCkgdG8gZml4IGl0Lgo+PiBUZXN0ZWQgb24gc3RtMzJtcDE1N2MtZXYxIGJvYXJkLgo+IAo+IElz
bid0IHRoZSBzcGVlZCBjaGVjayBjb3JyZWN0IHRob3VnaCA/CgpJIGFtIG5vdCBzdXJlIHRoaXMg
c3BlZWQgdGVzdCBpcyBuZWVkZWQuCgo+IAo+IFdoYXQgaXMgcmVhbGx5IGdvaW5nIG9uIHdoZW4g
dGhpcyBmYWlscyA/CgoKU2luY2UgODc0NWI5ZWJjY2FlICgidXNiOiBnYWRnZXQ6IGFkZCBzdXBl
ciBzcGVlZCBzdXBwb3J0IiksIApkcml2ZXItPnNwZWVkIGlzIG5vdyBzZXQgdG8gVVNCX1NQRUVE
X1NVUEVSIGluIGRyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYwoKYW5kIHRoaXMgZm9yYmlk
cyBkd2MyX3VkY19vdGcuYyB0byBiZSByZWdpc3RlcmVkLgoKUGF0cmljZQoKPiAKPj4gRml4ZXM6
IGM3OTFjODQzMWMzNCAoInVzYjogZHdjMjogY29udmVydCBkcml2ZXIgdG8gRE1fVVNCX0dBREdF
VCIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRj
X290Zy5jIHwgMTAgKystLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0
L2R3YzJfdWRjX290Zy5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jCj4+IGlu
ZGV4IGUzODcxZTM4MWUuLjRmM2Q3NjFlYjEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdXNiL2dh
ZGdldC9kd2MyX3VkY19vdGcuYwo+PiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNf
b3RnLmMKPj4gQEAgLTI0OCwxMCArMjQ4LDcgQEAgaW50IHVzYl9nYWRnZXRfcmVnaXN0ZXJfZHJp
dmVyKHN0cnVjdCB1c2JfZ2FkZ2V0X2RyaXZlciAqZHJpdmVyKQo+PiDCoCDCoMKgwqDCoMKgIGRl
YnVnX2NvbmQoREVCVUdfU0VUVVAgIT0gMCwgIiVzOiAlc1xuIiwgX19mdW5jX18sICJubyBuYW1l
Iik7Cj4+IMKgIC3CoMKgwqAgaWYgKCFkcml2ZXIKPj4gLcKgwqDCoMKgwqDCoMKgIHx8IChkcml2
ZXItPnNwZWVkICE9IFVTQl9TUEVFRF9GVUxMCj4+IC3CoMKgwqDCoMKgwqDCoCAmJiBkcml2ZXIt
PnNwZWVkICE9IFVTQl9TUEVFRF9ISUdIKQo+PiAtwqDCoMKgwqDCoMKgwqAgfHwgIWRyaXZlci0+
YmluZCB8fCAhZHJpdmVyLT5kaXNjb25uZWN0IHx8ICFkcml2ZXItPnNldHVwKQo+PiArwqDCoMKg
IGlmICghZHJpdmVyIHx8ICFkcml2ZXItPmJpbmQgfHwgIWRyaXZlci0+ZGlzY29ubmVjdCB8fCAh
ZHJpdmVyLT5zZXR1cCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDC
oMKgwqDCoMKgIGlmICghZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7
Cj4+IEBAIC0zMjAsMTAgKzMxNyw3IEBAIHN0YXRpYyBpbnQgZHdjMl9nYWRnZXRfc3RhcnQoc3Ry
dWN0IHVzYl9nYWRnZXQgKmcsCj4+IMKgIMKgwqDCoMKgwqAgZGVidWdfY29uZChERUJVR19TRVRV
UCAhPSAwLCAiJXM6ICVzXG4iLCBfX2Z1bmNfXywgIm5vIG5hbWUiKTsKPj4gwqAgLcKgwqDCoCBp
ZiAoIWRyaXZlciB8fAo+PiAtwqDCoMKgwqDCoMKgwqAgKGRyaXZlci0+c3BlZWQgIT0gVVNCX1NQ
RUVEX0ZVTEwgJiYKPj4gLcKgwqDCoMKgwqDCoMKgwqAgZHJpdmVyLT5zcGVlZCAhPSBVU0JfU1BF
RURfSElHSCkgfHwKPj4gLcKgwqDCoMKgwqDCoMKgICFkcml2ZXItPmJpbmQgfHwgIWRyaXZlci0+
ZGlzY29ubmVjdCB8fCAhZHJpdmVyLT5zZXR1cCkKPj4gK8KgwqDCoCBpZiAoIWRyaXZlciB8fCAh
ZHJpdmVyLT5iaW5kIHx8ICFkcml2ZXItPmRpc2Nvbm5lY3QgfHwgIWRyaXZlci0+c2V0dXApCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqAgwqDCoMKgwqDCoCBpZiAo
IWRldikKPj4KPiAKPiAKPiBbLi4uXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
