Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF1A96391
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 11:08:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52C4FC78F68;
	Tue, 22 Apr 2025 09:08:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6421C78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 09:08:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7Zhfo022804;
 Tue, 22 Apr 2025 11:08:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QsNhqaFlYodvujO9h/YQyO0+iQn8c9SGc54ZnobCb0s=; b=KWTDlYeNiN+00HW+
 8irRtyPqjk/0bmIzhxHpGnkiGssiHqsCby/R7hNa1Z07zyIa+xYIb9etve1NyBUm
 A/6JLNgz0fvoEcxRAjsI11Y6GRQBhcbiHL+Sse8+m78ycS796k4RkefBIdYAkSGM
 784bFeoTi0ynMjy2XbxBGxcnNrm/PyKu4AwSVEFl8pcQ+KalMaugmLsmstTeU+je
 Aa1hhnEp5G69oyMxZ3u7Tjid9FdmA1yKUFpDPKlFqsDRP4hoAosU69wyrqEmuKBl
 kmZ+tJqiYDoACx/Fh6AwmA9kep81SFuvKUVAmbwvkhXG+cBeSXfEUteqd2sGRCNy
 1KfQjA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46418m9mcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 11:08:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E29040073;
 Tue, 22 Apr 2025 11:07:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 304339DE566;
 Tue, 22 Apr 2025 11:06:44 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 11:06:43 +0200
Message-ID: <81432237-015c-491b-b30d-fef5c1bf3010@foss.st.com>
Date: Tue, 22 Apr 2025 11:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-8-patrice.chotard@foss.st.com>
 <e25079df-9db9-4fc7-8310-f213ce9b4fa0@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <e25079df-9db9-4fc7-8310-f213ce9b4fa0@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 07/13] configs: stm32: introduce
 stm32mp15-odyssey_defconfig
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

CgpPbiA0LzIyLzI1IDEwOjE2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMS8yNSAxNToxNCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBVLUJvb3QgRFQgZm9yIHN0
bTMybXAxNTdjLW9keXNzZXkgaXMgcmljaGVyIHRoYW4gdGhlIGtlcm5lbCBEVCBvbmUuCj4+IE5v
bmUgb2YgdGhlIHN0bTMybXAxNTdjLW9keXNzZXkncyBjb250cmlidXRvcnMgYW5zd2VyZWQgdG8g
bXkgcmVxdWVzdAo+PiB0byB1cGRhdGUga2VybmVsIERUIGFuZCBpIGRpZG4ndCBoYXZlIHRoaXMg
Ym9hcmQgdG8gdGVzdC4KPj4gVGhlIHNpbXBsZXIgaXMgdG8gYWRkIGEgZGVkaWNhdGVkIHN0bTMy
bXAxNS1vZHlzc2V5X2RlZmNvbmZpZyB3aXRoCj4+IE9GX1VQU1RSRUFNIGZsYWcgdW5zZXQuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Mu
c3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1wMTUtb2R5c3NleV9kZWZjb25m
aWcgfCAxNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTcyIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3Mvc3Rt
MzJtcDE1LW9keXNzZXlfZGVmY29uZmlnCj4+Cj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IAo+IAo+IGJ1dCBwZXJoYXBzIG5lZWQgdG8gYWRkIG1haW50YWluZXJzIGluZm9ybWF0aW9u
IGZvciB0aGlzIG5ldyBmaWxlID8KPiAKPiBpbiBib2FyZC9zdC9zdG0zMm1wMS9NQUlOVEFJTkVS
UwoKWWVzLCBpIHdpbGwgYWRkIG15c2VsZiBmb3IgaGlzIGJvYXJkLgoKVGhhbmtzClBhdHJpY2UK
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
