Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756E5B9F01
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:38:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBDCAC0D2BB;
	Thu, 15 Sep 2022 15:38:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB5FC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:38:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FBA7J9002109;
 Thu, 15 Sep 2022 17:38:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=wO/O1ndl5zfWrV6udff6JHO4haoFVTf3ep56QmaX43Y=;
 b=2BRaZsPazS+CU9tF31H68SkXZ5mAx3jA7ph1EwuK7vI1UEdPHVhb3HO8Szz2YQT2DtxY
 t944tUUZ+1bHs5w552K2bLUeNaamR20jRrjTlJzKnb7nwOdbZ50V1mr3XxAB1faHRsVr
 6U4LbH0DGDEXeQOq6rExheIS8V1bM6jPD6wkQWqU72yAnf39Eij7HcP4I932lovaPLR7
 R8kmegZjR2TanE3Bi6WwIZhNJayTnbsO3+MVdUwqmcyoIkRn1RfYLMXBWc7gvESvJEcg
 CK9BQNbk3PHjEq/hX0vvxdmwsathLN7EvO/7COJUu1WH1uNBUTGM+PTiaHNsjurHeGwE +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxxwnaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:38:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42B58100034;
 Thu, 15 Sep 2022 17:38:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EF99233C64;
 Thu, 15 Sep 2022 17:38:00 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:37:59 +0200
Message-ID: <7dc1d636-7b90-6ac3-be94-7512bd4163bb@foss.st.com>
Date: Thu, 15 Sep 2022 17:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.10 =
 u-boot-stm32-20220915
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

SGkgVG9tLAoKUGxlYXNlIHB1bGwgdGhlIFNUTTMyIHJlbGF0ZWQgZml4ZXMgZm9yIHUtYm9vdC9t
YXN0ZXIsIHYyMDIyLjEwOiAKdS1ib290LXN0bTMyLTIwMjIwOTE1CgotIEZpeGVzIG9uIFNUTTMy
IEkyQyBkcml2ZXJzCi0gQWN0aXZhdGUgU0NNSSByZWd1bGF0b3IgZm9yIFNUTTMyTVAxNSBkZWZj
b25maWcsIGZpeCB0aGUgdXNiIHN0YXJ0IGNvbW1hbmQKIMKgIGZvciBzY21pIGRldmljZSB0cmVl
CgpDSSBzdGF0dXM6IApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3Ut
Ym9vdC1zdG0vLS9waXBlbGluZXMvMTM0NTcKClRoYW5rcywKUGF0cmljawoKZ2l0IHJlcXVlc3Qt
cHVsbCBvcmlnaW4vbWFzdGVyIApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2Rp
YW5zL3UtYm9vdC1zdG0uZ2l0LyAKdS1ib290LXN0bTMyLTIwMjIwOTE1CgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IGQ2YTAzNzExZmRlMmE2Yzk5NjE0YWYyMGVlOTVhOWVmZTdh
ZDIzMmI6CgogwqAgTWVyZ2UgaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFu
cy91LWJvb3QtbWFydmVsbCAKKDIwMjItMDktMTMgMDg6MTk6NDIgLTA0MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDCoCBodHRwczovL3NvdXJjZS5kZW54LmRl
L3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0LyAKdGFncy91LWJvb3Qtc3RtMzItMjAy
MjA5MTUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhMjI2OTJkZDgxNWMyMGIzZmM2
MzU0YmU5NTRjZTY1OTIyNzYxYWQxOgoKIMKgIGkyYzogc3RtMzI6IGZpeCB1c2FnZSBvZiByaXNl
L2ZhbGwgZGV2aWNlIHRyZWUgcHJvcGVydGllcyAoMjAyMi0wOS0xNSAKMTQ6NTk6MjkgKzAyMDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCi0gRml4ZXMgb24gU1RNMzIgSTJDIGRyaXZlcnMKLSBBY3RpdmF0ZSBTQ01JIHJl
Z3VsYXRvciBmb3IgU1RNMzJNUDE1IGRlZmNvbmZpZywgZml4IHRoZSB1c2Igc3RhcnQgY29tbWFu
ZAogwqAgZm9yIHNjbWkgZGV2aWNlIHRyZWUKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxhaW4gVm9sbWF0ICgzKToKIMKg
wqDCoMKgwqAgaTJjOiBzdG0zMjogZml4IGNvbW1lbnQgYW5kIHJlbW92ZSB1bnVzZWQgQVVUT0VO
RCBiaXQKIMKgwqDCoMKgwqAgaTJjOiBzdG0zMjogcmVtb3ZlIHVudXNlZCBzdG9wIHBhcmFtZXRl
ciBpbiBzdGFydCAmIHJlbG9hZCBoYW5kbGluZwogwqDCoMKgwqDCoCBpMmM6IHN0bTMyOiBkbyBu
b3Qgc2V0IHRoZSBTVE9QIGNvbmRpdGlvbiBvbiBlcnJvcgoKSm9yZ2UgUmFtaXJlei1PcnRpeiAo
Mik6CiDCoMKgwqDCoMKgIGkyYzogc3RtMzJmNzogZml4IGNsZWFyaW5nIHRoZSBjb250cm9sIHJl
Z2lzdGVyCiDCoMKgwqDCoMKgIGkyYzogc3RtMzI6IGZpeCB1c2FnZSBvZiByaXNlL2ZhbGwgZGV2
aWNlIHRyZWUgcHJvcGVydGllcwoKUGF0cmljayBEZWxhdW5heSAoMSk6CiDCoMKgwqDCoMKgIGNv
bmZpZ3M6IHN0bTMybXAxNTogYWN0aXZhdGUgRE1fUkVHVUxBVE9SX1NDTUkKCiDCoGNvbmZpZ3Mv
c3RtMzJtcDE1X2RlZmNvbmZpZyB8wqAgMSArCiDCoGRyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmPC
oMKgIHwgMzMgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiDCoDIgZmlsZXMgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
