Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EFF31572A
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 20:51:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8558EC57B53;
	Tue,  9 Feb 2021 19:51:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E30D0C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 19:51:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119JmUCJ000604; Tue, 9 Feb 2021 20:51:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9KMJ8X5vRhUE5x4+TW6R69HowllfsCkqKsD8ZwPvDPs=;
 b=eoD0INAyiFwOECDvCK43s30RmJvu9GkQpTpt94DPVruMUVb/vZQHlrhmsOvKz+/BybDL
 U3aQrNYnFdD207RaWTy7kyVYEZ/IIwif9AGbPeZrlhU13dlEaN1pHpt+AQ5q5LZbVWHZ
 6cXbvNgpsnchPGH4OyyPHJL3yVA7FsB5Bgz9/F37HSgGoypSC7hRCcNB5SKXPNfUtesM
 SK5pZnR7Vi5znsi/T1m1sfD9qaiH7tkmZ7dAmiN8idPlWwoWBDWtz6oyH2T/YE19L99k
 8PVlM8bDlY6FRi36GkGvPPzQxhZ+sNvf4KoUOWH2UyV/4TyZ9yi8S+ixxrOLjEriXPkR UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrautruy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 20:51:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DDC310002A;
 Tue,  9 Feb 2021 20:51:27 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC39A241AEC;
 Tue,  9 Feb 2021 20:51:26 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.122) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 20:51:26 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
Date: Tue, 9 Feb 2021 20:51:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG3NODE5.st.com (10.75.127.72) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_06:2021-02-09,
 2021-02-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
 stm32mp1-hsotg to st, stm32mp15-hsotg
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

Ck9uIDIvOS8yMSAxMTozOSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMi85LzIxIDExOjE0
IEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+IEhpLAo+Cj4gWy4uLl0KPgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jIAo+PiBiL2RyaXZlcnMvdXNi
L2dhZGdldC9kd2MyX3VkY19vdGcuYwo+PiBpbmRleCBlMzg3MWUzODFlLi5lY2FjODBmYzExIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMKPj4gKysrIGIv
ZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jCj4+IEBAIC0xMTc2LDcgKzExNzYsNyBA
QCBzdGF0aWMgaW50IGR3YzJfdWRjX290Z19yZW1vdmUoc3RydWN0IHVkZXZpY2UgCj4+ICpkZXYp
Cj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBkd2MyX3VkY19vdGdfaWRzW10g
PSB7Cj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzbnBzLGR3YzIiIH0sCj4+IMKgwqDC
oMKgwqAgeyAuY29tcGF0aWJsZSA9ICJicmNtLGJjbTI4MzUtdXNiIiB9LAo+PiAtwqDCoMKgIHsg
LmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtaHNvdGciLAo+PiArwqDCoMKgIHsgLmNvbXBhdGli
bGUgPSAic3Qsc3RtMzJtcDE1LWhzb3RnIiwKPj4gwqDCoMKgwqDCoMKgwqAgLmRhdGEgPSAodWxv
bmcpZHdjMl9zZXRfc3RtMzJtcDFfaHNvdGdfcGFyYW1zIH0sCj4KPiBJIGhhdmUgdG8gcG9pbnQg
b3V0IHRoZSBvYnZpb3VzLCBEVCBpcyBBQkksIHRoaXMgYnJlYWtzIEFCSS4gSG93ZXZlciwgCj4g
ZG8gd2UgY2FyZSBhYm91dCBvdXQtb2YtdHJlZSBEVHMgaGVyZSA/CgoKSSBrbm93IHRoYXQgdGhl
IGJpbmRpbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBhbmQgImJpbmFyeSBjb21wYXRpYmxlIiAK
dGhlIGlzIGEga2V5IGVsZW1lbnQgb2YgRFQKCmZvciB0aGUgTGludXgga2VybmVsIChmb3IgZXhh
bXBsZSB0aGUgbGF0ZXN0IGtlcm5lbCBpbWFnZSBzaG91bGQgd29yayAKd2l0aCBhIG9sZCBkZXZp
Y2UgdHJlZSkuCgoKSSBkb24ndCBzZWUgdGhlIHNhbWUgcmVxdWlyZW1lbnQgZm9yIFUtQm9vdCBh
cyBleHRlcm5hbCBEVCAod2l0aCBFWFRfRFRCIApvcHRpb24pIGlzIG5vdCBjb21tb24gLgoKClNv
IHRvZGF5IEkgYXNzdW1lIHRoYXQgVS1Cb290IHVzZSBvbmx5IGluLXRyZWUgRFQgZm9yIHN0bTMy
bXAxNSAKcGxhdGZvcm1zIHVudGlsIHdlIGhhdmUgYQoKMTAwJSB1cHN0cmVhbSBsZXZlbCBvZiB0
aGUgc3RtMzJtcDEgcGxhdGZvcm0gd2l0aCBiaW5kaW5nIGFsaWduZWQgd2l0aCAKTGludXgga2Vy
bmVsIGJpbmRpbmdzCgooZm9yIGV4YW1wbGUgd2UgaGF2ZSBzb21lIG90aGVyIHBlbmRpbmcgaXNz
dWUgZm9yIFVTQlBIWUMgYmluZGluZykuCgoKQnV0IGlmIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
aXMgcmVhbGx5IGJsb2NraW5nIGZvciBVLUJvb3QgdXNlciwgSSBjYW4gCmNoYW5nZSBteSBtaW5k
LgoKClBTOiBJIGNvcnJlY3QgYSBpc3N1ZSBoZXJlLCBiZWNhdXNlIEkgdXBzdHJlYW0gdGhlIHN0
bTMybXAgZG93bnN0cmVhbSAKYmluZGluZyBmb3IgZHdjMiwKCmJ1dCB0aGlzIGNvbXBhdGlibGUg
aGFkIGJlIG1vZGlmaWVkIGJlZm9yZSBhY2NlcHRlZCBieSBMaW51eCBrZXJuZWwgRFQgCm1haW50
YWluZWVycwoKPT4gdG9kYXkgVVNCIGluIExpbnV4IGtlcm5lbCBjYW4ndCB3b3JrIHdpdGggdGhl
IERUIHVzZWQgYnkgVS1Cb290CgoKUmVnYXJkcwoKClBhdHJpY2sKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
