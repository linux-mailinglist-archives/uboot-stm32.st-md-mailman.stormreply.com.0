Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08506700961
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 May 2023 15:43:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB5FC6904E;
	Fri, 12 May 2023 13:43:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCA3DC65E60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 13:43:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9oSo6013380; Fri, 12 May 2023 15:43:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9uqHYN2i8ke0w6z6jTvVaOaDrWBHY8T3qGBRjvUf2gw=;
 b=uLDdLSgRsWeiSaR4OgURiCnAj1rjMeJ539F4XKGQQ/ZbjfKHlizZ+AzFcYWDwLOEKAie
 mKaz2Flvxz8KxJWGUyeAualDoiy+pjOQ1lazOmf8bXz82HSjYIHVBFhEJcpJsdAF36h/
 sT2yfOd7gDBTDKsuffdbs6WgrcuM2AfVdUzkIH8r3d1o+/uV2IBBrlWYblL8YS+kdYRG
 nAiCvoM6r8TU0R696YG4nD9RAX+gNvWAwBRFhza0FLVhVCkznq+RTRcyfeo+3yLMLAhv
 dDfb59mrqwr8xMq4JU92XUYRnX8uYGqOgSsNqPZ0vREUudU988sCvxui1e83WzYlj4M4 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhk64hkaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 15:43:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DCB010002A;
 Fri, 12 May 2023 15:43:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 253CE24B88A;
 Fri, 12 May 2023 15:43:27 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 12 May
 2023 15:43:26 +0200
Message-ID: <a850167d-bdb1-4b05-0d90-4bc6d5303d8f@foss.st.com>
Date: Fri, 12 May 2023 15:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
 <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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

SGksCgpPbiA1LzExLzIzIDEzOjU0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzExLzIzIDA4
OjM5LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4KPiBIaSwKPgo+PiBPbiA1LzExLzIzIDAyOjIy
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IEluIGNhc2UgdGhlIElXREcgaXMgZW5hYmxlZCBieSBl
aXRoZXIgVS1Cb290IG9yIExpbnV4LCB0aGUgSVdERyBjYW4gCj4+PiBuZXZlcgo+Pj4gYmUgZGlz
YWJsZWQgYWdhaW4uIFRoYXQgaW5jbHVkZXMgbG93IHBvd2VyIHN0YXRlcywgd2hpY2ggbWVhbnMg
dGhhdCAKPj4+IGlmIHRoZQo+Pj4gSVdERyBpcyBlbmFibGVkLCB0aGUgU29DIHdvdWxkIHJlc2V0
IGl0c2VsZiBhZnRlciBhIHdoaWxlIGluIHN1c3BlbmQgCj4+PiB2aWEKPj4+IHRoZSBJV0RHLiBU
aGlzIGlzIG5vdCBkZXNpcmVkIGJlaGF2aW9yLgo+Pj4KPj4+IEl0IGlzIHBvc3NpYmxlIHRvIGVu
YWJsZSBJV0RHIHByZS10aW1lb3V0IElSUSB3aGljaCBpcyByb3V0ZWQgaW50byAKPj4+IHRoZSBF
WFRJLAo+Pj4gYW5kIHVzZSB0aGF0IElSUSB0byB3YWtlIHRoZSBDUFUgdXAgYmVmb3JlIHRoZSBJ
V0RHIHRpbWVvdXQgaXMgCj4+PiByZWFjaGVkIGFuZAo+Pj4gcmVzZXQgaXMgdHJpZ2dlcmVkLiBU
aGlzIHByZS10aW1lb3V0IElSUSBjYW4gYmUgdXNlZCB0byByZWxvYWQgdGhlIAo+Pj4gV0RUIGFu
ZAo+Pj4gdGhlbiBzdXNwZW5kIHRoZSBDUFUgYWdhaW4gZXZlcnkgb25jZSBpbiBhIHdoaWxlLgo+
Pj4KPj4+IEltcGxlbWVudCB0aGlzIGZ1bmN0aW9uYWxpdHkgZm9yIGJvdGggSVdERzEgYW5kIElX
REcyIGJ5IHJlYWRpbmcgb3V0IAo+Pj4gYWxsCj4+PiB0aGUgdW5tYXNrZWQgSVJRcywgY29tcGFy
aW5nIHRoZSBsaXN0IHdpdGggY3VycmVudGx5IHBlbmRpbmcgSVJRcyBpbiAKPj4+IEdJQ3YzOgo+
Pj4gLSBJZiBhbnkgSVJRIGlzIHBlbmRpbmcgYW5kIGl0IGlzIE5PVCBJV0RHMSBvciBJV0RHMiBw
cmUtdGltZW91dCBJUlEsCj4+PiDCoMKgIHdha2UgdXAgYW5kIGxldCBPUyBoYW5kbGUgdGhlIElS
UXMKPj4+IC0gSWYgSVdERzEgb3IgSVdERzIgSVJRIGlzIHBlbmRpbmcgYW5kIG5vIG90aGVyIElS
USBpcyBwZW5kaW5nLAo+Pj4gwqDCoCBwaW5nIHRoZSByZXNwZWN0aXZlIElXREcgYW5kIHN1c3Bl
bmQgYWdhaW4KPj4+Cj4+PiBUaGlzIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBhbnkgYWR2ZXJzZSBp
bXBhY3Qgb24gcG93ZXIgY29uc3VtcHRpb24gCj4+PiBpbiBzdXNwZW5kLgo+Cj4gWy4uLl0KPgo+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIFBpbmcgSVdERzIgYW5kIEFDSyBwcmV0aW1lciBJUlEgKi8K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoaXdkZzJfd2FrZSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd3JpdGVsKElXREdfS1JfUkVMT0FEX0tFWSwgU1RNMzJfSVdERzJfQkFTRSArIElX
REdfS1IpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKElXREdfRVdDUl9FV0lD
LCBTVE0zMl9JV0RHMl9CQVNFICsgSVdER19FV0NSKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+
PiArwqDCoMKgIH0KPj4+IMKgIMKgwqDCoMKgwqAgd3JpdGVsKDB4MywgU1RNMzJfUkNDX0JBU0Ug
KyBSQ0NfTVBfU1JFUUNMUlIpOwo+Pj4gwqDCoMKgwqDCoCBkZHJfc3dfc2VsZl9yZWZyZXNoX2V4
aXQoKTsKPj4KPj4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPgo+Cj4gSSBmZWVsIGxpa2UgbWF5YmUgSSBuZWVkIHRvIHdoYWNrIHRo
ZSBJV0RHIGFsc28gQkVGT1JFIGVudGVyaW5nIAo+IHN1c3BlbmQsIGV4cGVjdCBhIFYyIHNob3J0
bHkuCj4KPiBEbyB5b3UgdGhpbmsgdGhpcyBJV0RHIGFwcHJvYWNoIGlzIGZpbmUgdG8ga2VlcCB0
aGUgc3lzdGVtIGZyb20gCj4gcmVib290aW5nIGluIHN1c3BlbmQgPyBPciBkbyB5b3Ugc2VlIGFu
eSBiZXR0ZXIgb3B0aW9uIGZvciB0aGUgTVAxID8KCgpJIHRoaW5rIGl0IGlzIGZpbmUgaWYgeW91
IHdhbnQgdG8gaGF2ZSB3YXRjaGRvZyBydW5uaW5nIGluIFNUQU5EQlkgZXZlbiAKdGhpcyBwYXRj
aCBmb3JjZSBhIHdha2V1cC4KCmJ1dCBpZiBJV0RHIDEgb3IgMiBzaG91bGQgYmUgbm90IHJ1bm5p
bmcgaW4gU1RBTkRCWSAoYnV0IGFsc28gZm9yIFNUT1ApIApmb3IgeW91ciBwcm9kdWN0LAoKaXQg
Y2FuIGJlIG1hbmFnZWQgZGlyZWN0bHkgYnkgdGhlIGhhcmR3YXJlIHdpdGggT1RQLCB0byBmcmVl
emUgd2F0Y2hkb2cuCgo9PiBpdCBpcyBhIGRlY2lzaW9uIGZvciBlYWNoIHByb2R1Y3Qgb2YgdGhl
IGRlc2lyZWQgYmVoYXZpb3Igb2YgdGhlIElXREcgCmluIGxvdyBwb3dlciBtb2RlLgoKClNlZSBS
ZWYgTWFudWFsOiA0OC4zIElXREcgaW1wbGVtZW50YXRpb24KClRhYmxlIDMzMi4gU1RNMzJNUDE1
N3ggSVdERyBmZWF0dXJlcwoKT3B0aW9uIGJ5dGVzIHRvIGNvbnRyb2wgdGhlIGFjdGl2aXR5IGlu
IFN0YW5kYnkgbW9kZSAoNikKCjYuIENvbnRyb2xsZWQgdmlhIG9wdGlvbiBieXRlcyBPVFBfSVdE
RzFfRlpfU1RBTkRCWSBhbmQgCk9UUF9JV0RHMl9GWl9TVEFOREJZLCByZXNwZWN0aXZlbHksIGZv
ciBJV0RHMSBhbmQgSVdERzIuCgphbmQgaW7CoFRhYmxlMTcgPT4gT1RQIDE4ID0gSFcyIGJpdCA1
IHRvIDgKCgpSZWdhcmRzCgpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
