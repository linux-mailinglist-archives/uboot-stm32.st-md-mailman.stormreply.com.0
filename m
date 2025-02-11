Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F1A305F6
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 09:40:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E03DDC78F7B;
	Tue, 11 Feb 2025 08:40:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C098BC78F7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 08:39:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B4owCF019487;
 Tue, 11 Feb 2025 09:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ZIeZqaGaPoC/kwEFknSvJEsaNhfq7zXw1TPEN6x77G4=; b=KbE8cyLFxZKqqqNb
 IIZQlsRhyfFSSBiSuplcBcbhzdJkwfSefTUklK0FlywaUP86WfeqgIyh9kNjKtS+
 XwHfV78MxKQZoWo/1M/HZ6Mlgob4L0qAlBPxTFWgDFoNgEI5p7n/9otMo44MCPLq
 jRq00q1S5Fq8PAixWN40V5OrSC4t4fAsfzs1j2GxJJ5/BGj2VyMWPXcvWjRLq9yI
 YyqdWoTA69zD+MogvWOT1HHY3TN76tzDzsDXghB6JHnT9bkzMUmo5SRCUjj+Dg9c
 LTrZXTeSOHcI6Odoh0YZxFkkogwYcNNqP6DQM62swPm5WrHu4DrGNRow15JoqusT
 L8D3dQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wt22uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 09:39:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D5B3840059;
 Tue, 11 Feb 2025 09:38:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D5B72CEF87;
 Tue, 11 Feb 2025 09:24:47 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Feb
 2025 09:24:46 +0100
Message-ID: <23ee53ac-fced-4110-829f-399346ed7376@foss.st.com>
Date: Tue, 11 Feb 2025 09:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
 <87zfldnlmw.fsf@baylibre.com>
 <c89e94bf-0ed6-4b3f-9f3b-eee9d30a91df@foss.st.com>
 <f1d2068c-b393-4b90-b923-aa51b0972dc3@denx.de> <87lduc6hnh.fsf@baylibre.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <87lduc6hnh.fsf@baylibre.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

CgpPbiAyLzExLzI1IDA4OjU0LCBNYXR0aWpzIEtvcnBlcnNob2VrIHdyb3RlOgo+IE9uIGx1bi4s
IGbDqXZyLiAxMCwgMjAyNSBhdCAxNDo0MiwgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IHdy
b3RlOgo+IAo+PiBPbiAyLzEwLzI1IDExOjI4IEFNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+
PiBIaSBNYXJlawo+Pgo+PiBIaSwKPj4KPj4+IEFueSBjaGFuY2UgdG8gZ2V0IHRoaXMgcGF0Y2gg
bWVyZ2VkIGluIG5leHQgVS1Cb290IHRhZyAyMDI1LjA0LXJjMiA/Cj4+IEdhZGdldCBzdHVmZiBp
cyBvbiBNYXR0aWpzIGRlc2ssIHBsZWFzZSBwaW5nIG1lIGluIGEgZmV3IGRheXMgaWYgaGUgCj4+
IGRvZXNuJ3QgcGljayBpdCB1cCwgSSdsbCBkbyBzbyB0aGVuLiBTb3JyeSBmb3IgdGhlIGRlbGF5
Lgo+IAo+IFNvbWVob3csIHRoaXMgd2FzIG5vdCBhc3NpZ25lZCB0byBtZSBvbiBwYXRjaHdvcmss
IHNvIEkgbWlzc2VkIHRoaXMuCj4gU29ycnkgYWJvdXQgdGhlIGRlbGF5LCB3aWxsIHBpY2sgdXAg
dG9kYXkuCgpUaGFua3MgOy0pCgpQYXRyaWNlIApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
