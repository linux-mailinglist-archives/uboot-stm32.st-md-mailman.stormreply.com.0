Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D874A23A58
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 08:59:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEEC4C78002;
	Fri, 31 Jan 2025 07:59:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AB59C78006
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 07:59:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7pCul006643;
 Fri, 31 Jan 2025 08:59:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 p3D3uZm14Bxs32shxz6j/vJai7XG+wd0011jwgidSTA=; b=tpGtvP39fGe4FDGH
 JxXB59LTEn5MuJ124G1IHbDti51yApWDOe45Yk25WM+dZNdHx5L5onV7Vyp5Aqlt
 ckUo8c0m3o+kzw7NJYcv8h3m8u62wb3I9MR0H9K5zv9hdBrsuuCFGpKzBuOqGsnw
 UcIkxe0/yUrE/U3FM44qOaoEeXsbQj05p8aQxB2OdQ6jt9y01s47AQbMyj+b+AmX
 Jl4mxk7Xkb7+P5JVDoVLB6R9Z7YWT4WrtsK0+nYifa9bzxOcILbeGj/hXSzqDmwH
 i6idLBaemO8zB1LlIED2vPtDIuYeX8HPSKuYl8YZSwOAnvwosgoYDXrVdxQVQpKk
 toDXoQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7ghss9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 08:59:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A4E7E40054;
 Fri, 31 Jan 2025 08:58:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 434B427EEDB;
 Fri, 31 Jan 2025 08:56:43 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:56:42 +0100
Message-ID: <36fb582a-2c6d-4102-bd80-e1850f23021e@foss.st.com>
Date: Fri, 31 Jan 2025 08:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-3-patrice.chotard@foss.st.com>
 <1cccf0a2-e317-4b00-9624-d2d25c8b4ae4@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1cccf0a2-e317-4b00-9624-d2d25c8b4ae4@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/6] arm: stm32mp: stm32prog: fix
 warning when CONFIG_SYS_64BIT_LBA is enable
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

CgpPbiAxLzgvMjUgMTk6NDgsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTEvMjkvMjQgMTM6MjcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gSWYgQ09ORklHX1NZU182
NEJJVF9MQkEgZmxhZyBpcyBlbmFibGUsIGZvbGxvd2luZyB3YXJuaW5nIGlzIHRyaWdnZXJlZDoK
Pj4KPj4gLi4vYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvc3RtMzJwcm9nLmM6
IEluIGZ1bmN0aW9uICdpbml0X2RldmljZSc6Cj4+IC4uL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9j
bWRfc3RtMzJwcm9nL3N0bTMycHJvZy5jOjc5MzoyNzogd2FybmluZzogZm9ybWF0Cj4+ICclbGQn
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSAnbG9uZyBpbnQnLCBidXQgYXJndW1lbnQgOCBoYXMg
dHlwZQo+PiAnbGJhaW50X3QnIHtha2EgJ2xvbmcgbG9uZyB1bnNpZ25lZCBpbnQnfSBbLVdmb3Jt
YXQ9XQo+PiDCoMKgIDc5MyB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9nX2Rl
YnVnKCJNTUMgJWQ6IGxiYT0lbGQgYmxrc3o9JWxkXG4iLCBkZXYtPmRldl9pZCwKPj4gwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IC4uL2luY2x1ZGUvbG9nLmg6MTU3
OjIxOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICdwcl9mbXQnCj4+IMKgwqAgMTU3IHwg
I2RlZmluZSBwcl9mbXQoZm10KSBmbXQKPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fgo+PiAuLi9pbmNsdWRlL2xvZy5oOjE4MjozMzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdsb2cnCj4+IMKgwqAgMTgyIHwgI2RlZmluZSBs
b2dfZGVidWcoX2ZtdC4uLinCoMKgwqDCoMKgIGxvZyhMT0dfQ0FURUdPUlksIExPR0xfREVCVUcs
ICMjX2ZtdCkKPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fgo+PiAuLi9hcmNoL2FybS9tYWNo
LXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnByb2cuYzo3OTM6MTc6IG5vdGU6IGluIGV4cGFu
c2lvbgo+PiBvZiBtYWNybyAnbG9nX2RlYnVnJwo+PiDCoMKgIDc5MyB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbG9nX2RlYnVnKCJNTUMgJWQ6IGxiYT0lbGQgYmxrc3o9JWxkXG4i
LCBkZXYtPmRldl9pZCwKPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBefn5+fn5+fn4KPj4gLi4vYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnBy
b2cvc3RtMzJwcm9nLmM6NzkzOjQyOiBub3RlOiBmb3JtYXQgc3RyaW5nCj4+IGlzIGRlZmluZWQg
aGVyZQo+PiDCoMKgIDc5MyB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9nX2Rl
YnVnKCJNTUMgJWQ6IGxiYT0lbGQgYmxrc3o9JWxkXG4iLCBkZXYtPmRldl9pZCwKPj4gwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfn5eCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBsb25nIGludAo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAl
bGxkCj4+Cj4+IENhc3QgYmxvY2tfZGV2LT5sYmEgdG8gdTY0IGFuZCBzZXQgdGhlIGxlbmd0aCBz
cGVjaWZpZXIgdG8gJWxsZCB3aGljaAo+PiBpcyBvayB3aXRoIG9yIHdpdGhvdXQgQ09ORklHX1NZ
U182NEJJVF9MQkEgZmxhZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNo
LXN0bTMybXAvY21kX3N0bTMycHJvZy9zdG0zMnByb2cuYyB8IDQgKystLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+IAo+IAo+IFJldmll
d2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+
IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpU
aGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
