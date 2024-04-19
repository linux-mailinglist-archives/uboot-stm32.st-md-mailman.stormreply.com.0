Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E568AAE78
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:31:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74974C6DD72;
	Fri, 19 Apr 2024 12:31:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 940A7C6C859
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:30:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9Pkuu030179; Fri, 19 Apr 2024 14:30:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=FcWPwRRzhwmI6CWneIS0CNZ5pHIL2cvtM2Zmkce+gHM=; b=Gv
 MTEYZspT0eyOe4m256JFmXIxSffbOQeqouOzsj7+CyubZJ5318cVOnoALrzR4VlQ
 +qaAJ5l8iuxhicCSKENbYERJCQ3YCXJK0GhmgQ86YjDAmT3OpUg1p6ROfciWf7mb
 15wsrtfBR+LSYxNyivQX8N9vL6ZhSGLDqTWgsZG9n9JRqBBUj0cM9uDefSUtrdbx
 DCFeX3rgkxsb0BfhMglt/127WUiVINddhmpnCx6dfaA6CLY+BGnKqJ9f1bWWTw9S
 YTmZ/2PQj+UmbhuBaC5aWs0SJ4avotBW6DRzO6yzrtAVvA2CsjPcjCZv8tamu284
 BlsVrhkbuIS1Yz4bhFcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyrd7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:30:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DAFA64002D;
 Fri, 19 Apr 2024 14:30:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C5C221ADB2;
 Fri, 19 Apr 2024 14:30:40 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:30:39 +0200
Message-ID: <a8403388-29ee-42d7-a6e9-ace2a5ca5d98@foss.st.com>
Date: Fri, 19 Apr 2024 14:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-25-patrice.chotard@foss.st.com>
 <20b44b2a-fe4e-47ea-b335-b94b2771538b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20b44b2a-fe4e-47ea-b335-b94b2771538b@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 24/25] ARM: dts: stm32: Update red led
 node for stm32mp157c-ed1-scmi-u-boot
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

CgpPbiA0LzE3LzI0IDExOjEzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBcyBpbmRpY2F0ZWQgaW4g
a2VybmVsIGxlZCBkdC1iaW5kaW5ncywgbGFiZWwgaXMgYSBkZXByZWNhdGVkCj4+IHByb3BlcnR5
LCBzbyByZW1vdmUgaXQgYW5kIHVzZSBsZWQgbm9kZSdzIG5hbWUgaW5zdGVhZCBmb3IKPj4gdS1i
b290LGVycm9yLWxlZCBwcm9wZXJ0eS4KPj4gUmVuYW1lIHJlZCBsZWQgbm9kZSdzIG5hbWUgdG8g
bGVkLXJlZC4KPj4gUmVtb3ZlIHN0YXR1cyBwcm9wZXJ0eSB3aGljaCBpcyB1c2VsZXNzLgo+PiBB
ZGQgY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiOyB3aGljaCBpcyBub3QgcHJlc2VudCBpbiBrZXJu
ZWwgRFQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdj
LWVkMS1zY21pLXUtYm9vdC5kdHNpIHwgOCArKysrLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+IAo+IAo+IFJldmlld2VkLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5r
cwo+IFBhdHJpY2sKPiAKCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
