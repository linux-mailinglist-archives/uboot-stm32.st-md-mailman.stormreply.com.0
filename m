Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB3338C88
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:18:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D20CC57196;
	Fri, 12 Mar 2021 12:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8BA3C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:18:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC7C8K031389; Fri, 12 Mar 2021 13:18:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=10JV7ZhaRYZKgbVvogtCORMfTY5oLfMKiJwWpvXGdaw=;
 b=gv/IVdsFayGfgHTaL5LiQuMeOCp/Ms4CQS+oA0mKUWNzObhkn8FZfNqTpGv63X6WEYCx
 dzryu0OCuVoNauQaKdgSvJp9vYZbFoVSZeObj2gKDtTElXtEXRwuWRpiSMPKI7UHaiNg
 Opyp++X8rMdOcZUOWEAqXX3kY2uo7akv+987YmgqG5utqs8623xXnku8WBJN9m5ttsOu
 g8QyZzfCDB8E5hBCoYvHDvH0b12GyWDRvZaphsaXdsYqn8rCmnTMSLtuZ/fTCVXIlXmf
 vAKHNPLkNWiblkdjuvSqb5gFbflrUIFyvLPgv5mCgXtV9CCn5y8ODjG/ecmTgwqpWQ9s eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5ry6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:18:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE231100034;
 Fri, 12 Mar 2021 13:18:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3C9D23C77F;
 Fri, 12 Mar 2021 13:18:41 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:18:40 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
 <20210120134205.30488-3-patrice.chotard@foss.st.com>
 <b1a87f5d-a1b7-ca46-6056-5c911b785fa2@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6ceec323-3997-fa08-be0a-4adf0430c061@foss.st.com>
Date: Fri, 12 Mar 2021 13:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1a87f5d-a1b7-ca46-6056-5c911b785fa2@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Jagan
 Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] spi: stm32_qspi: Add WATCHDOG_RESET
 in _stm32_qspi_read_fifo()
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

SGkKCk9uIDEvMjcvMjEgNDoxNSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBQYXRy
aWNlCj4gCj4gT24gMS8yMC8yMSAyOjQyIFBNLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IElu
IGNhc2Ugb2YgcmVhZGluZyBsYXJnZSBhcmVhIGFuZCBtZW1vcnktbWFwIG1vZGUgaXMgbWlzY29u
ZmlndXJlZAo+PiAobWVtb3J5LW1hcCBzaXplIGRlY2xhcmVkIGxvd2VyIHRoYW4gdGhlIHJlYWwg
c2l6ZSBvZiB0aGUgbWVtb3J5IGNoaXApCj4+IHdhdGNoZG9nIGNhbiBiZSB0cmlnZ2VyZWQuCj4+
Cj4+IEFkZCBXQVRDSERPR19SRVNFVCgpIGluIF9zdG0zMl9xc3BpX3JlYWRfZmlmbyB0byBmaXgg
aXQuCj4+Cj4+IElzc3VlIHJlcHJvZHVjZWQgd2l0aCBzdG0zMm1wMTU3Yy1ldjEgYm9hcmQgYW5k
IG1lbW9yeSBtYXAgc2l6ZSBzZXQgdG8KPj4gMSwgd2l0aCBmb2xsb3dpbmcgY29tbWFuZDoKPj4g
c2YgcmVhZCAweEMwMDAwMDAwIDAgMHg0MDAwMDAwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAg
ZHJpdmVycy9zcGkvc3RtMzJfcXNwaS5jIHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zdG0zMl9xc3BpLmMg
Yi9kcml2ZXJzL3NwaS9zdG0zMl9xc3BpLmMKPj4gaW5kZXggOTU4YzM5NGExYS4uYzNkYTE3Zjk5
MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zcGkvc3RtMzJfcXNwaS5jCj4+ICsrKyBiL2RyaXZl
cnMvc3BpL3N0bTMyX3FzcGkuYwo+PiBAQCAtMTEsNiArMTEsNyBAQAo+PiDCoCAjaW5jbHVkZSA8
Y2xrLmg+Cj4+IMKgICNpbmNsdWRlIDxyZXNldC5oPgo+PiDCoCAjaW5jbHVkZSA8c3BpLW1lbS5o
Pgo+PiArI2luY2x1ZGUgPHdhdGNoZG9nLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwu
aD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2lvcG9ydC5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgv
c2l6ZXMuaD4KPj4gQEAgLTE2Myw2ICsxNjQsNyBAQCBzdGF0aWMgaW50IF9zdG0zMl9xc3BpX3dh
aXRfY21kKHN0cnVjdCBzdG0zMl9xc3BpX3ByaXYgKnByaXYsCj4+IMKgIHN0YXRpYyB2b2lkIF9z
dG0zMl9xc3BpX3JlYWRfZmlmbyh1OCAqdmFsLCB2b2lkIF9faW9tZW0gKmFkZHIpCj4+IMKgIHsK
Pj4gwqDCoMKgwqDCoCAqdmFsID0gcmVhZGIoYWRkcik7Cj4+ICvCoMKgwqAgV0FUQ0hET0dfUkVT
RVQoKTsKPj4gwqAgfQo+PiDCoCDCoCBzdGF0aWMgdm9pZCBfc3RtMzJfcXNwaV93cml0ZV9maWZv
KHU4ICp2YWwsIHZvaWQgX19pb21lbSAqYWRkcikKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiAK
PiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bS9uZXh0CgpUaGFua3MKClBhdHJpY2UK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
