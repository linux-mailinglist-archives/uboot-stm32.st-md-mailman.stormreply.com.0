Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07447710B90
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 May 2023 13:57:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0F3C6A611;
	Thu, 25 May 2023 11:57:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C16C8C04B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 11:57:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PASVln013040; Thu, 25 May 2023 13:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bvMN49xlDrxzLv66X+PTuk51MUhJXzk+0/dwu/XBMVY=;
 b=YR/NIiW1rltV4qQqL5VzFXDAUlUisy05X+ziRtCss7nRxlVaEYkdtRVB/vx4gyouvt4i
 syLmrGpbkd7SW4PJBYqi2z1WUbqzApKB5NSbrQxTrT7CiI79ns19zCrHbTOdTIaJxozU
 2p4ZpYoviR/IqWbsruJ3JaumzTji7ovNFJG1a132E+3HTFeQh8O6OWmcXmHAerhyWAu5
 eZazRnLtdSnPXQ/DIOivJmxV3iO6aoK2sZEMnZHe7BSc4ZNWVb6X3Hi+rdFpeZA6wKwx
 OmPMzEc1HWxoMZcndK8WCkmFAjflsjEXm4XVvRFSgQLIFViL7dSSmbQUTpej1CNxgmi1 xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt39tt0cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 13:57:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E53C10002A;
 Thu, 25 May 2023 13:57:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4EAEE21ADDD;
 Thu, 25 May 2023 13:57:53 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 25 May
 2023 13:57:52 +0200
Message-ID: <05d299c9-8e1d-231b-214e-e7dceadf5e76@foss.st.com>
Date: Thu, 25 May 2023 13:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Patrice CHOTARD
 <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
 <0a44a562-fe18-c8a5-393a-a526be3ca42d@denx.de>
 <a850167d-bdb1-4b05-0d90-4bc6d5303d8f@foss.st.com>
 <0ee4f382-4c6e-0209-3db9-83d44219c710@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <0ee4f382-4c6e-0209-3db9-83d44219c710@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_06,2023-05-25_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, antonio.borneo@foss.st.com,
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

SGkKCk9uIDUvMTIvMjMgMTU6NTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMTIvMjMgMTU6
NDMsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+IEhpLAo+Cj4gSGksCj4KPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIC8qIFBpbmcgSVdERzIgYW5kIEFDSyBwcmV0aW1lciBJUlEgKi8KPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChpd2RnMl93YWtlKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHdyaXRlbChJV0RHX0tSX1JFTE9BRF9LRVksIFNUTTMyX0lXREcyX0JBU0UgKyBJV0RHX0tS
KTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKElXREdfRVdDUl9FV0lDLCBT
VE0zMl9JV0RHMl9CQVNFICsgSVdER19FV0NSKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+
Pj4gK8KgwqDCoCB9Cj4+Pj4+IMKgIMKgwqDCoMKgwqAgd3JpdGVsKDB4MywgU1RNMzJfUkNDX0JB
U0UgKyBSQ0NfTVBfU1JFUUNMUlIpOwo+Pj4+PiDCoMKgwqDCoMKgIGRkcl9zd19zZWxmX3JlZnJl
c2hfZXhpdCgpOwo+Pj4+Cj4+Pj4KPj4+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gSSBmZWVsIGxpa2UgbWF5YmUgSSBu
ZWVkIHRvIHdoYWNrIHRoZSBJV0RHIGFsc28gQkVGT1JFIGVudGVyaW5nIAo+Pj4gc3VzcGVuZCwg
ZXhwZWN0IGEgVjIgc2hvcnRseS4KPj4+Cj4+PiBEbyB5b3UgdGhpbmsgdGhpcyBJV0RHIGFwcHJv
YWNoIGlzIGZpbmUgdG8ga2VlcCB0aGUgc3lzdGVtIGZyb20gCj4+PiByZWJvb3RpbmcgaW4gc3Vz
cGVuZCA/IE9yIGRvIHlvdSBzZWUgYW55IGJldHRlciBvcHRpb24gZm9yIHRoZSBNUDEgPwo+Pgo+
Pgo+PiBJIHRoaW5rIGl0IGlzIGZpbmUgaWYgeW91IHdhbnQgdG8gaGF2ZSB3YXRjaGRvZyBydW5u
aW5nIGluIFNUQU5EQlkgCj4+IGV2ZW4gdGhpcyBwYXRjaCBmb3JjZSBhIHdha2V1cC4KPj4KPj4g
YnV0IGlmIElXREcgMSBvciAyIHNob3VsZCBiZSBub3QgcnVubmluZyBpbiBTVEFOREJZIChidXQg
YWxzbyBmb3IgCj4+IFNUT1ApIGZvciB5b3VyIHByb2R1Y3QsCj4KPiBXaHkgPwo+Cj4gSSB3YW50
IHRoZSB3YXRjaGRvZyB0byBtb25pdG9yIHRoYXQgdGhlIHBsYXRmb3JtIGlzIHN0aWxsIE9LLCBl
dmVuIGluIAo+IHN1c3BlbmQuIEFsc28sIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBvbmNlIHRoZSBJ
V0RHIGlzIHN0YXJ0ZWQsIGl0IAo+IGNhbm5vdCBiZSBzdG9wcGVkLCByaWdodCA/CgoKd2l0aG91
dCBjaGFuZ2UgT1RQIChzbyB3aXRoIHRoZSBkZWZhdWx0IGJlaGF2aW9yKQoKPT4geWVzIHRoZSB3
YXRjaGRvZyBJV0RHIGlzIHJ1bm5pbmcgd2l0aG91dCB3YXkgdG8gc3RvcCBpdC4KCgo+Cj4+IGl0
IGNhbiBiZSBtYW5hZ2VkIGRpcmVjdGx5IGJ5IHRoZSBoYXJkd2FyZSB3aXRoIE9UUCwgdG8gZnJl
ZXplIHdhdGNoZG9nLgo+Pgo+PiA9PiBpdCBpcyBhIGRlY2lzaW9uIGZvciBlYWNoIHByb2R1Y3Qg
b2YgdGhlIGRlc2lyZWQgYmVoYXZpb3Igb2YgdGhlIAo+PiBJV0RHIGluIGxvdyBwb3dlciBtb2Rl
Lgo+Pgo+Pgo+PiBTZWUgUmVmIE1hbnVhbDogNDguMyBJV0RHIGltcGxlbWVudGF0aW9uCj4+Cj4+
IFRhYmxlIDMzMi4gU1RNMzJNUDE1N3ggSVdERyBmZWF0dXJlcwo+Pgo+PiBPcHRpb24gYnl0ZXMg
dG8gY29udHJvbCB0aGUgYWN0aXZpdHkgaW4gU3RhbmRieSBtb2RlICg2KQo+Pgo+PiA2LiBDb250
cm9sbGVkIHZpYSBvcHRpb24gYnl0ZXMgT1RQX0lXREcxX0ZaX1NUQU5EQlkgYW5kIAo+PiBPVFBf
SVdERzJfRlpfU1RBTkRCWSwgcmVzcGVjdGl2ZWx5LCBmb3IgSVdERzEgYW5kIElXREcyLgo+Pgo+
PiBhbmQgaW7CoFRhYmxlMTcgPT4gT1RQIDE4ID0gSFcyIGJpdCA1IHRvIDgKPgo+IEkgc2F3IHRo
ZSBPVFAgZnVzZXMsIGJ1dCBJIGRvbid0IHdhbnQgdG8gYmxvdyB0aGVtLiBPciBpcyB0aGF0IHJl
YWxseSAKPiB0aGUgc3VnZ2VzdGlvbiBTVCB3b3VsZCBwcm92aWRlIGZvciBzdXNwZW5kL3Jlc3Vt
ZSwgYmxvdyB0aGUgZnVzZXMgPwo+Cj4gKEkgd29uZGVyLCB3aHkgaXNuJ3QgdGhlIGxvZ2ljIG9m
IHRob3NlIGZ1c2VzIGludmVydGVkIHRoZW4sIGkuZS4gYnkgCj4gZGVmYXVsdCBzdG9wIHRoZSB3
YXRjaGRvZyBpbiBzdXNwZW5kIEFORCBibG93IGZ1c2VzIHRvIGtlZXAgaXQgcnVubmluZyAKPiBp
biBzdXNwZW5kPykKCgppdCBpcyBhIFNvQyBkZXNpZ24gY2hvaWNlID0+IHRoZSBkZWZhdWx0IGJl
aGF2aW9yIGlzIHdhdGNoZG9nIGlzIHJ1bm5pbmcgCmluIHN0YW5kYnkgYW5kIHN0b3AsIHNvIHlv
dSBuZWVkIHRvIHJlbG9hZCBpdAoKVGhhdCBpbXBseSB0aGUgbGltaXQgb2YgdGhlIGR1cmF0aW9u
IG9mIG1heCBkdXJhdGlvbiBvZiBzdGFuZGJ5IHRvIGF2b2lkIApyZXNldC4uLi4KCmFuZCB0aGUg
dXNhZ2Ugb2YgSVdERyBwcmUtdGltZW91dCBpbiB0aGlzIGNhc2UgaXQgYSBnb29kIHBsYWNlIHRv
IHdha2V1cCAKdGhlIFNvQwoKYW5kIGFkZCBzYW5pdHkgY2hlY2tzIChjaGVjayB0aGUgc3lzdGVt
IGlzIHN0aWxsIHJ1bm5pbmcpIGJlZm9yZSB0byAKcmVsb2FkIGl0LgoKClBhdHJpY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
