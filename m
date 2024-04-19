Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A46898AAE76
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:30:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D4DEC6DD72;
	Fri, 19 Apr 2024 12:30:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03376C6C859
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:30:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9Drd2009768; Fri, 19 Apr 2024 14:30:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=qrPf81bX61yZ5Mp44A0UbcOXQUzUQ76+r05qn65rzY4=; b=7Y
 EhdfeSKH148foBGeNKwQFS2xHvmp4Ocdu2XV332F5QTQ32BgLIx/H+7pnO0B0oQN
 2dBKtUZanOcBNCfUO4hcqr6QURlRNpr7O/TLHlshA1K/iVps/A4WHUTMgibOEX0O
 qfd+iDkCZjSIBdhFSYs/QNCHEQfHe2zZM4xpb29kQb+4VkG8h9anSOcHGC63zcSN
 4tfb3voing9ivf24hO/piOf/eLwdEnl1J3BjWmlanN3zroywPx8tDcPFgyIt9jhq
 wDXGPPPsrU0kGbbMm8J8LQMjKkkPqPw0CFmWaIBK6FroXQCMbvSQfvN2+6ZYe0hY
 pHA2tq6yedTxc9ZZcGlg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64uv6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:30:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0518F40045;
 Fri, 19 Apr 2024 14:30:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A64C521ADA7;
 Fri, 19 Apr 2024 14:30:33 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:30:33 +0200
Message-ID: <8884ff8c-8f35-4ffd-a8b7-7e1f096c1276@foss.st.com>
Date: Fri, 19 Apr 2024 14:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-24-patrice.chotard@foss.st.com>
 <ad7bf212-046c-46ec-b9ac-0b9e64236faf@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ad7bf212-046c-46ec-b9ac-0b9e64236faf@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 23/25] ARM: dts: stm32: Don't probe red
 led at boot for stm32mp157c-ed1-scmi-u-boot
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
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiByZWQgbGVkIGFuZCBidXR0
b24gZGVkaWNhdGVkIHRvIGZhc3Rib290IHNoYXJlIHRoZSBzYW1lIGdwaW8gR1BJT0ExMy4KPj4g
TGVkIGRyaXZlciBpcyBwcm9iZWQgZWFybHkgc28gdGhlIGNvcnJlc3BvbmRpbmcgZ3BpbyBpcyB0
YWtlbiBhbmQKPj4gY29uZmlndXJlZCBpbiBvdXRwdXQgd2hpY2ggZm9yYmlkIGZhc3Rib290IGFu
ZCBzdG0zMnByb2cgYnV0dG9uIHVzYWdlLgo+Pgo+PiBUbyBhdm9pZCB0aGlzLCByZW1vdmUgdGhl
ICJkZWZhdWx0LXN0YXRlIiBwcm9wZXJ0eSBmcm9tIHJlZCBsZWQgbm9kZS4KPj4KPj4gVGhpcyB3
aWxsIGF2b2lkIHRvIHRyaWdnZXIgdGhlIGxlZCBkcml2ZXIgcHJvYmUoKSB0byBjb25maWd1cmUg
dGhlIGxlZAo+PiBkZWZhdWx0IHN0YXRlIGR1cmluZyBzdGFydHVwLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0t
Cj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1lZDEtc2NtaS11LWJvb3QuZHRzaSB8
IDEgLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+IAo+IAo+IFJldmll
d2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+
IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
