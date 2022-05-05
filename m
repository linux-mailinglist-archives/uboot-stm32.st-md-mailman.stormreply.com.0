Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274351C2E4
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 May 2022 16:48:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39542C5F1F1;
	Thu,  5 May 2022 14:48:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA38FC5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 14:48:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EQoIs001608;
 Thu, 5 May 2022 16:48:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YETgJc1SFkHUyMHufFlatHahPTispUXs7Y29ONC8q4Y=;
 b=c/kUfPqc0f+RhlIGDERUp1QlxSvN7xN08GAED/4obhfz7MPFNy9oxhbfJfv05Z1JN/O6
 MNqRVMMJYevxuQwI25lev0Y5tURSmLgG4EX8ry/WnTVSKm+1Oj0OjVfsyYlR4iSwwv37
 AsbpA1ZFJ584SS+FiiZUOxEDd9eJxoiEysV+j7v5j/disf7w/UZSyfhWmDtMolEukrRQ
 WrBoqngkntSMfR9M/KMpZl4LmfYs0NK6n+4VhbDnRYKXnnymIms3pt2ea+dXWxjhvdyq
 EfBlmzawal1hKcA3P9ZGpWx/tWqzBs4Ktbi6w+2LqjXbvze8dM/MqAymJDtpWW2bRLu2 fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gm7pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 16:48:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3533D10002A;
 Thu,  5 May 2022 16:48:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EBCB226FA1;
 Thu,  5 May 2022 16:48:21 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 5 May
 2022 16:48:20 +0200
Message-ID: <c344eab9-ba1b-32ca-d85c-7119462173b1@foss.st.com>
Date: Thu, 5 May 2022 16:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
 <40514ed1-9899-059f-0010-eb6b972c217a@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <40514ed1-9899-059f-0010-eb6b972c217a@denx.de>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_06,2022-05-05_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] usb: host: ehci-generic: Make usage
 of clock/reset bulk() API
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

SGkgTWFyZWsKCk9uIDUvNS8yMiAxNTo0NCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS81LzIy
IDE1OjE3LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPj4gQEAgLTgxLDY4
ICs3OSwzMSBAQCBzdGF0aWMgaW50IGVoY2lfdXNiX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYp
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGdlbmVyaWNfZWhjaSAqcHJpdiA9IGRldl9nZXRfcHJpdihk
ZXYpOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBlaGNpX2hjY3IgKmhjY3I7Cj4+IMKgwqDCoMKgwqAg
c3RydWN0IGVoY2lfaGNvciAqaGNvcjsKPj4gLcKgwqDCoCBpbnQgaSwgZXJyLCByZXQsIGNsb2Nr
X25iLCByZXNldF9uYjsKPj4gK8KgwqDCoCBpbnQgZXJyLCByZXQ7Cj4+IMKgIMKgwqDCoMKgwqAg
ZXJyID0gMDsKPj4gLcKgwqDCoCBwcml2LT5jbG9ja19jb3VudCA9IDA7Cj4+IC3CoMKgwqAgY2xv
Y2tfbmIgPSBvZm5vZGVfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MoZGV2X29mbm9kZShkZXYpLCAi
Y2xvY2tzIiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICIjY2xvY2stY2VsbHMiLCAwKTsKPj4gLcKgwqDCoCBpZiAoY2xvY2tfbmIgPiAwKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoCBwcml2LT5jbG9ja3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBjbG9j
a19uYiwgc2l6ZW9mKHN0cnVjdCBjbGspLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmICgh
cHJpdi0+Y2xvY2tzKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsK
Pj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGNsb2NrX25iOyBpKyspIHsK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gY2xrX2dldF9ieV9pbmRleChkZXYsIGks
ICZwcml2LT5jbG9ja3NbaV0pOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChl
cnIgPCAwKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBjbGtfZW5hYmxlKCZwcml2LT5jbG9ja3NbaV0pOwo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyICYmIGVyciAhPSAtRU5PU1lTKSB7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8g
ZW5hYmxlIGNsb2NrICVkXG4iLCBpKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbGtfZnJlZSgmcHJpdi0+Y2xvY2tzW2ldKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGNsa19lcnI7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+Y2xvY2tfY291bnQrKzsKPj4gLcKgwqDCoMKgwqDC
oMKgIH0KPj4gLcKgwqDCoCB9IGVsc2Ugewo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGNsb2NrX25i
ICE9IC1FTk9FTlQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJm
YWlsZWQgdG8gZ2V0IGNsb2NrIHBoYW5kbGUoJWQpXG4iLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNsb2NrX25iKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGNsb2NrX25iOwo+PiAtwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIHJldCA9IGNsa19nZXRf
YnVsayhkZXYsICZwcml2LT5jbG9ja3MpOwo+PiArwqDCoMKgIGlmIChyZXQpIHsKPj4gK8KgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOwo+IAo+IFBy
aW50IHRoZSBlcnJvciBjb2RlIGluIHRoZSBlcnJvciBtZXNzYWdlLCBzbyB0aGUgdXNlciBjYW4g
aW1tZWRpYXRlbHkgZGV0ZXJtaW5lIHdoYXQgd2VudCB3cm9uZyB3aXRob3V0IHJlYnVpbGRpbmcg
dGhlIGNvZGUgd2l0aCBleHRyYSBkZWJ1ZyBwcmludHMgKGFuZCB0aGF0IGdvZXMgZm9yIG90aGVy
IG1lc3NhZ2VzIGFuZCBvdGhlciBkcml2ZXJzIHRvbywgdGhlIGVycm9yIGNvZGUgaXMgdXNlZnVs
IHRoZXJlKS4KPiAKPiBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgY2xvY2tzIChyZXQ9JWQp
XG4iLCByZXQpOwo+IAo+IFsuLi5dCgpSaWdodCwgaSB3aWxsIGFkZCB0aGUgcmV0IHZhbHVlIGlu
IGRldl9lcnIoKTsKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
