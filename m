Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18F6481F4
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Dec 2022 12:50:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C01A9C65E6E;
	Fri,  9 Dec 2022 11:50:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 286B5C65E6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 11:50:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B9BGq17003880; Fri, 9 Dec 2022 12:50:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VVSKywkz+oivy+YS3sxzgLHtF1ggswjxdzK1EzEp5ZI=;
 b=FtA1fXOndDtwIdK5W1hslngqWGo67qDF8OehVtbmnBjEvw+CxkCG9kAGE9ISvde934W3
 cBDJFfjDisIBMIIdeKwVLrR9g3oAROSR4nBGyNYcQHq3CgxpPOxqXxxkz+M098xgSBmv
 +Q8O6fGZezLuRfNOtIJcBIzLI48MODUj2x8xLCB5gBk6bqIgAEQ6Ote6+WEHRDhw9C+m
 aK9GL438oAjwtaJG/njVOIIYrRL3jOkcxvmsMZq5rUB54qBer8t6nc+RV6BJjkCIQW1n
 G6sOft1yc2imtXlR3rL8A/QxgpYl/6ZFQm8D/nIhza6vnMQ7asflo7lb9wl6V+CWzObX +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrrp1qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 12:50:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBB8D100034;
 Fri,  9 Dec 2022 12:50:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B261421FE8C;
 Fri,  9 Dec 2022 12:50:43 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 9 Dec
 2022 12:50:43 +0100
Message-ID: <7e23f155-4e7b-1ed5-7b4c-38d7d34d2f20@foss.st.com>
Date: Fri, 9 Dec 2022 12:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221026150508.1.I1b5ffc3bca09502549c075039f405dceb1646084@changeid>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] dm: pmic: ignore disabled node in
	pmic_bind_children
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

SGkgSmFlaG9vbiwKCk9uIDEwLzI2LzIyIDE1OjA1LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+
IElnbm9yZSB0aGUgZGlzYWJsZWQgY2hpbGRyZW4gbm9kZSBpbiBwbWljX2JpbmRfY2hpbGRyZW4o
KSBzbyB0aGUKPiBkaXNhYmxlZCByZWd1bGF0b3JzIGluIGRldmljZSB0cmVlIGFyZSBub3QgcmVn
aXN0ZXJlZC4KPgo+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdGhlIGRtX3NjYW5fZmR0X25vZGUo
KSBjb2RlIC0gb25seSB0aGUKPiBhY3RpdmF0ZWQgbm9kZXMgYXJlIGJvdW5kIC0gIGFuZCBpdCBz
b2x2ZXMgcG9zc2libGUgaXNzdWUgd2hlbiBhCj4gZGVhY3RpdmF0ZWQgcmVndWxhdG9yIGlzIGJv
dW5kLCBlcnJvciBmb3IgZHVwbGljYXRlZCByZWd1bGF0b3IgbmFtZQo+IGZvciBleGFtcGxlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPiAtLS0KPiBUaGlzIHBhdGNoIHNvbHZlcyB0aGUgZXJyb3JzIGZvciBkdXBsaWNh
dGVkIHJlZ3VsYXRvciBuYW1lcyBvbiBTVE0zMk1QMTV4Cj4gYm9hcmRzIHNpbmNlIHRoZSBhbGln
bm1lbnQgd2l0aCBMaW51eCBkZXZpY2UgdHJlZSB3aXRoIHRoZSBjb21taXQKPiA5MTU3YTRjZTM2
YjE4ICgiQVJNOiBkdHM6IHN0bTMyOiB1cGRhdGUgU0NNSSBkZWRpY2F0ZWQgZmlsZSIpLgo+Cj4g
V2hlbiBTQ01JIGlzIGFjdGl2YXRlZCBpbiAiPGJvYXJkPi1zY21pLmR0cyIgZGV2aWNlIHRyZWUs
IHRoZSAzIHJlZ3VsYXRvcnMKPiByZWcxMSwgcmVnMTgsIHVzYjMzIGFyZSBkdXBsaWNhdGVkIChj
aGlsZHJlbiBvZiBzY21pX3JlZ3VscyBhbmQgb2YKPiBwd3JfcmVndWxhdG9ycykgZXZlbiBpZiB0
aGUgY2hpbGRyZW4gb2YgcHdyX3JlZ3VsYXRvcnMgYXJlIGRlYWN0aXZhdGVkIGluCj4gdGhlIGZp
bGUgYXJjaC9hcm0vZHRzL3N0bTMybXAxNS1zY21pLmR0c2kuCj4KPiAgIGRyaXZlcnMvcG93ZXIv
cG1pYy9wbWljLXVjbGFzcy5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wb3dlci9wbWljL3BtaWMtdWNsYXNzLmMg
Yi9kcml2ZXJzL3Bvd2VyL3BtaWMvcG1pYy11Y2xhc3MuYwo+IGluZGV4IDVkY2Y2ZDgwNzlkMi4u
MGUyZjVlMWY0MTExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcG93ZXIvcG1pYy9wbWljLXVjbGFz
cy5jCj4gKysrIGIvZHJpdmVycy9wb3dlci9wbWljL3BtaWMtdWNsYXNzLmMKPiBAQCAtMzksNiAr
MzksMTAgQEAgaW50IHBtaWNfYmluZF9jaGlsZHJlbihzdHJ1Y3QgdWRldmljZSAqcG1pYywgb2Zu
b2RlIHBhcmVudCwKPiAgIAkJbm9kZV9uYW1lID0gb2Zub2RlX2dldF9uYW1lKG5vZGUpOwo+ICAg
Cj4gICAJCWRlYnVnKCIqIEZvdW5kIGNoaWxkIG5vZGU6ICclcydcbiIsIG5vZGVfbmFtZSk7Cj4g
KwkJaWYgKCFvZm5vZGVfaXNfZW5hYmxlZChub2RlKSkgewo+ICsJCQlkZWJ1ZygiICAtIGlnbm9y
aW5nIGRpc2FibGVkIGRldmljZVxuIik7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0KPiAgIAo+ICAg
CQljaGlsZCA9IE5VTEw7Cj4gICAJCWZvciAoaW5mbyA9IGNoaWxkX2luZm87IGluZm8tPnByZWZp
eCAmJiBpbmZvLT5kcml2ZXI7IGluZm8rKykgewoKCkdlbnRsZSByZW1pbmRlciwKCml0IGlzIHBv
c3NpYmxlIHRvIHJldmlldyBoYXZlIHRoaXMgcGF0Y2ggaW4gdGhlIG5leHQgdjIwMjMuMDEgcHVs
bCByZXF1ZXN0LAoKb3IsIGlmIHlvdSBwcmVmZXJlLMKgIEkgY2FuIGludGVncmF0ZSBpdCBpbiB0
aGUgbmV4dCBzdG0zMiBwdWxsIHJlcXVlc3QuCgoKUGF0cmljawoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
