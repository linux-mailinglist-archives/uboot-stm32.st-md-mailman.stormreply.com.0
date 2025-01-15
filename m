Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8EA12073
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jan 2025 11:45:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8058C78F77;
	Wed, 15 Jan 2025 10:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA8CC6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 10:45:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F99ak7004285;
 Wed, 15 Jan 2025 11:45:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 az58jljd3bfj5Xx1CVwcUFBTbLWJlzpAM5JOOiN5Uq0=; b=xTCpo88L1d+Q7MFL
 +WY2ZW+rN6dMY89h6t/3DeXxLoBRj+0zY7QK+MwwTDwqnwWqjRxLKE2z9yZdD34o
 iczQZJe9sOfobM/eI2FCU5uUMcIuWYzTS2XmUgejLMMO+2Zrngt4Gdd+NVZPxBDD
 M8jtvuOLWia7m5qhxzFikPbI1iEwtYG7z8B2tEdMyvKQfliZl+Qf/fppZAJOxU0q
 GXTh+FQSF/KVI+cIv2bmUHvs5q4AiK+niRrhEjvzPRNcU4Mondn0DS0VXovrRpb0
 poyUlVu0m7XYL+ysUDMQPxbkWGPfUgdhwdkenZY1Iphgp1OB0ROcIjdRDrXCN5L0
 tlQDpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44637n9y71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 11:45:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 10B9F40048;
 Wed, 15 Jan 2025 11:44:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4611D24C453;
 Wed, 15 Jan 2025 11:43:41 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 11:43:40 +0100
Message-ID: <cbb93a24-4b4e-4254-b031-39c1abfa67ba@foss.st.com>
Date: Wed, 15 Jan 2025 11:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-7-patrice.chotard@foss.st.com>
 <de9e66e1-ab5a-4d46-9ec9-b19627f4ea9b@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <de9e66e1-ab5a-4d46-9ec9-b19627f4ea9b@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] dw3-generic: Add dependencies whith
 SYSCON and REGMAP
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

CgpPbiAxLzE0LzI1IDE1OjU0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxLzE0LzI1IDM6NDUg
UE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gU2luY2UgYWRkaXRpb24gb2YgU1RpSDQwNyBz
dXBwb3J0IGluIGR3YzMtZ2VuZXJpYywgU1lTQ09OIGFuZCBSRUdNQVAKPj4gc3VwcG9ydCBhcmUg
bmVlZGVkLgo+Pgo+PiBBZGQgZGVwZW5kZW5jaWVzIHdpdGggU1BMX1JFR01BUCBhbmQgU1BMX1NZ
U0NPTiBmb3I6Cj4+IHFjbTY0OTAsIGlteDhtcF9ldmssIHBoeWNvcmUtaW14OG1wLCBsaWJyZW01
LCBxY29tLAo+PiB4aWxpbnhfdmVyc2FsX25ldF92aXJ0LCBhbWRfdmVyc2FsMl92aXJ0LCB4aWxp
bnhfenlucW1wX2tyaWEKPj4geGlsaW54X3p5bnFtcF92aXJ0Lgo+Pgo+PiBBZGQgZGVwZW5kZW5j
aWVzIHdpdGggU1BMX1JFR01BUCBhbmQgU1BMX1NZU0NPTiBmb3IgYW01N3h4X2hzX2V2bV91c2Iu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZv
c3Muc3QuY29tPgo+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+Pgo+
PiDCoCBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgfCA0ICsrKysKPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9L
Y29uZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnCj4+IGluZGV4IDAxMDA3MjNhNjhiLi5l
ZjgyYTNlOTYyNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnCj4+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZwo+PiBAQCAtMjYsNiArMjYsMTAgQEAgY29uZmln
IFVTQl9EV0MzX09NQVAKPj4gwqAgY29uZmlnIFVTQl9EV0MzX0dFTkVSSUMKPj4gwqDCoMKgwqDC
oCBib29sICJHZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIGEgRFdDMyB3cmFwcGVyIChha2EgZHdj
MyBnbHVlKSIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIERNX1VTQiAmJiBVU0JfRFdDMyAmJiBN
SVNDCj4+ICvCoMKgwqAgc2VsZWN0IFNQTF9SRUdNQVAgaWYgU1BMCj4+ICvCoMKgwqAgc2VsZWN0
IFNQTF9TWVNDT04gaWYgU1BMCj4+ICvCoMKgwqAgc2VsZWN0IFJFR01BUAo+PiArwqDCoMKgIHNl
bGVjdCBTWVNDT04KPiBXaHkgd2FzIHRoaXMgbm90IG5lZWRlZCBzbyBmYXIgPyBPciBpcyB0aGlz
IGEgYnVnZml4ID8KCk15IGNvbW1lbnQgbGFja3Mgb2YgZGV0YWlsLgpCeSBhZGRpbmcgc3RpaDQw
NyBzdXBwb3J0LCBpIGFtIHVzaW5nIHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoKSB3
aGljaCAKbmVlZCB0aGF0IFJFR01BUCBhbmQgU1lTQ09uIHN1cHBvcnQgYXJlIGVuYWJsZWQuCgpU
aGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
