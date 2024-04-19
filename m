Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFA8AAE8C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:34:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1B67C6DD9A;
	Fri, 19 Apr 2024 12:34:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34009C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:34:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAnTDb006062; Fri, 19 Apr 2024 14:34:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xVY2qhAycv0ruaeiWuv46IpyNvVnZbegJ5Uirru5/eI=; b=Fi
 G+PiR2vGPzD8Nls9BxLdpzsXhMoPSJtxOIh1KqQf/vKI1gBF4XBiISVoTWGk8olU
 m2YCGLE2W9JC1Ds41rpm7PQaurBu47kacdp39N4HWbip0F1Xvt8AbrdhSqfBE5LO
 5M2fBOcjx4Se+RTdVk/+DPnKIzEh3L6KkCm75PXtBGvecnJM7lChxAgecTxVGxP2
 OLC50I+jOXHoiGlQbeb7t3iUG1cOTmhcZXrTTArnPNR2duGIbrjxfoVRQTsQW5oD
 EWDtNN9kKojrO+GubL/oDIEGaSGrETYMbGuzzJ4Mec2JkmGYnS0JVdF1hILhssJI
 7dc16tCFryYQn1v/Genw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m12bgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:34:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46FEB4002D;
 Fri, 19 Apr 2024 14:34:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95C9921ADC6;
 Fri, 19 Apr 2024 14:33:43 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:33:43 +0200
Message-ID: <9a17c368-191b-4b1c-ad02-92fd2dbda680@foss.st.com>
Date: Fri, 19 Apr 2024 14:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <480ef8f6-2cc0-4014-8025-19b5c48a14fd@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <480ef8f6-2cc0-4014-8025-19b5c48a14fd@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: Fix partition node
 name for stm32mp157c-ev1-u-boot
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

CgpPbiA0LzE3LzI0IDEwOjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDMvOC8yNCAxNDo1MCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGaXggZmxhc2hAMCBhbmQg
bmFuZEAwIHBhcnRpdGlvbiBub2RlIG5hbWUgd2l0aCBjb3JyZWN0IG9mZnNldC4KPj4KPj4gRml4
ZXM6IGU5MWQzYzYxNzY3YiAoImFybTogZHRzOiBzdG0zMjogQWRkIHBhcnRpdGlvbnMgaW4gZmxh
c2gwIGFuZCBuYW5kCj4+IG5vZGUgZm9yIHN0bTMybXAxNXh4LWV2MSIpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAt
LS0KPj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWV2MS11LWJvb3QuZHRzaSB8IDgg
KysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1i
b290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpCj4+IGlu
ZGV4IDEzOTk0MGJkNWQ0Li4zNTE1MzQ3ZTkxZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRz
L3N0bTMybXAxNTdjLWV2MS11LWJvb3QuZHRzaQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJt
cDE1N2MtZXYxLXUtYm9vdC5kdHNpCj4+IEBAIC0zMywxMSArMzMsMTEgQEAKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiZnNibDEiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHgwMDAwMDAwMCAweDAwMDQwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIH07Cj4+IC3CoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25AODAwMDAgewo+PiArwqDCoMKgwqDC
oMKgwqAgcGFydGl0aW9uQDQwMDAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFi
ZWwgPSAiZnNibDIiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMDA0
MDAwMCAweDAwMDQwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IC3CoMKgwqDCoMKg
wqDCoCBwYXJ0aXRpb25AMTAwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkA4MDAw
MCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gInNzYmwiOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMDA4MDAwMCAweDAwMjAwMDAwPjsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IEBAIC01OCw3ICs1OCw3IEBACj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImZzYmwyIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4MDAwNDAwMDAgMHgwMDA0MDAwMD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB9Owo+PiAtwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uQDEwMDAwMCB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBwYXJ0aXRpb25AODAwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJl
bCA9ICJmaXAiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMDA4MDAw
MCAweDAwNDAwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IEBAIC0xMTIsNyArMTEy
LDcgQEAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVs
ID0gImZpcDIiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVnID0gPDB4MDA2MDAwMDAgMHgwMDQwMDAwMD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJ0aXRp
b25AMTIwMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9u
QGEwMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
YWJlbCA9ICJVQkkiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDB4MDBhMDAwMDAgMHgzZjYwMDAwMD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfTsKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4g
CkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
