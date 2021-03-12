Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F84338C8B
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:19:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1790DC57196;
	Fri, 12 Mar 2021 12:19:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02EF6C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:19:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC75rc031009; Fri, 12 Mar 2021 13:19:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WAmAwi8bpMGUgN5IRpNElBUz1b6Yxq+gevjeu6tMpfo=;
 b=i4l+CcmBIODSBArkqpslm1R94nVX5g+t72w3+hDAfXjoTUq9TCaHtQrWBVLjOVa7m9uI
 pykmzlN8eKKk1R5wzs/wyp8ZIV+L0UugB2YrOTkLwTO5YwaYvswoLRSVSA+RY6iprLSC
 0UyUXxgW1Whn2xpmZhYKErSi+Fwa9gmg6csTyrsv4f9vL1Vw4VXmX7woulJEzc8f5s/Q
 g2TNOCzAb0wWJH9vpwfhDYjx5Oym4doYMazrdjVHFuAIJ1VOOh0JWucV1AxNT1ieqEGt
 DFEb8aj3PbBMB/BJVlr++7QEGxo2pHPSXhS2Mnt9o/R/qfa0IFCQ0qwx/Cx5RD6/MHj1 Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5s39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:19:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7A9010002A;
 Fri, 12 Mar 2021 13:19:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EC6F225141;
 Fri, 12 Mar 2021 13:19:41 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:19:40 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-5-patrice.chotard@foss.st.com>
 <24411175-20ba-92ae-e1b4-bba0c7ae7ca5@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <8d1cd1c0-444e-5340-0061-350805eaad8f@foss.st.com>
Date: Fri, 12 Mar 2021 13:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24411175-20ba-92ae-e1b4-bba0c7ae7ca5@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] mtd: spinand: Add WATCHDOG_RESET() in
 spinand_mtd_read/write()
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

SGkKCk9uIDEvMjcvMjEgNDoxOSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAK
PiBPbiAxLzIwLzIxIDI6NDIgUE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gSW4gY2FzZSBv
ZiBiaWcgYXJlYSByZWFkL3dyaXRlIG9uIHNwaSBuYW5kLCB3YXRjaGRvZyB0aW1lb3V0IG1heSBv
Y2N1cnMuCj4+IFRvIGZpeCB0aGF0LCBhZGQgV0FUQ0hET0dfUkVTRVQoKSBpbiBzcGluYW5kX210
ZF9yZWFkKCkgYW5kCj4+IHNwaW5hbmRfbXRkX3dyaXRlKCkgdG8gZW5zdXJlIHRoYXQgd2F0Y2hk
b2cgaXMgcmVzZXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pgo+PiAtLS0KPj4KPj4gwqAgZHJpdmVycy9tdGQvbmFu
ZC9zcGkvY29yZS5jIHwgMyArKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+IGluZGV4IGNiOGZmYTNmYTkuLjdmNTQ0MjJjOTMgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gQEAgLTI0LDYgKzI0LDcgQEAKPj4gwqAgI2luY2x1ZGUg
PGVycm5vLmg+Cj4+IMKgICNpbmNsdWRlIDxzcGkuaD4KPj4gwqAgI2luY2x1ZGUgPHNwaS1tZW0u
aD4KPj4gKyNpbmNsdWRlIDx3YXRjaGRvZy5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvbXRkL3Nw
aW5hbmQuaD4KPj4gwqAgI2VuZGlmCj4+IMKgIEBAIC01NzQsNiArNTc1LDcgQEAgc3RhdGljIGlu
dCBzcGluYW5kX210ZF9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwKPj4g
wqAgI2VuZGlmCj4+IMKgIMKgwqDCoMKgwqAgbmFuZGRldl9pb19mb3JfZWFjaF9wYWdlKG5hbmQs
IGZyb20sIG9wcywgJml0ZXIpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIFdBVENIRE9HX1JFU0VUKCk7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3BpbmFu
ZCwgaXRlci5yZXEucG9zLnRhcmdldCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gQEAgLTYyNSw2ICs2MjcsNyBA
QCBzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3dyaXRlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3QgdG8sCj4+IMKgICNlbmRpZgo+PiDCoCDCoMKgwqDCoMKgIG5hbmRkZXZfaW9fZm9yX2VhY2hf
cGFnZShuYW5kLCB0bywgb3BzLCAmaXRlcikgewo+PiArwqDCoMKgwqDCoMKgwqAgV0FUQ0hET0df
UkVTRVQoKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNwaW5hbmRfc2VsZWN0X3Rhcmdl
dChzcGluYW5kLCBpdGVyLnJlcS5wb3MudGFyZ2V0KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IAo+IAo+IFJldmll
d2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+
IAo+IFRoYW5rcwo+IAo+IFBhdHJpY2sKPiAKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtL25leHQK
ClRoYW5rcwoKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
