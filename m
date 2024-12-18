Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27C9F63A8
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45FFFC78030;
	Wed, 18 Dec 2024 10:45:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EF08C78018
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI71cpa021836;
 Wed, 18 Dec 2024 11:45:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wEEbuU95mrx0txULYp5EoePK0XSYT9GmWJcQosKpgTU=; b=zBC3pjqAjO8yA30j
 R+NddQOPUzD6G9foF3d/K1jbPXEd+IDr1YAZs7ZC+ds9qlMvCfAACgMpYuFWC6bQ
 bjEDojHHm+4S7hD+VJUClZS63Ov+Na1NNb4kAJmcFZmlvS+aF9ayBJSSdgQg3TUD
 vKDM0kcdEabPNu22AlxGb0lPJRO50kNJ8ulofc49JFbifv7qk5s1REr0IChak4nQ
 6DoCdewJEgLG8Lz6rs3TjcRjFKRPIGQkGuk+4jgnv/5hlnyKfDUAhfLGEaKDaA4H
 rlTAtvha0uXa3xGyLzsA/SkMZW0wpcj9kmwqnDV5MR7lmTJkvzizg+P2/+roXdmF
 AjPWpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8am8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6EF1440088;
 Wed, 18 Dec 2024 11:44:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E80925B066;
 Wed, 18 Dec 2024 11:43:06 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:43:05 +0100
Message-ID: <b66b21f4-82d1-447a-b17c-459780cf8237@foss.st.com>
Date: Wed, 18 Dec 2024 11:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241216102219.347725-1-patrice.chotard@foss.st.com>
 <cc93eab6-8e50-41db-8f00-076dd11766dc@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <cc93eab6-8e50-41db-8f00-076dd11766dc@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] configs: stm32mp1: Restore boot SPL
 from sdcard for stm32mp15
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

CgpPbiAxMi8xOC8yNCAxMDowMiwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMi8xNi8yNCAxMToyMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBSZXN0b3JlIGJvb3Qg
U1BMIGZyb20gc2RjYXJkIGZvciBTVE0zMk1QMSBwbGF0Zm9ybXMuCj4+Cj4+IEZpeGVzOiAyYTAw
ZDczZDA4MWEgKCJzcGw6IG1tYzogVHJ5IHRvIGNsZWFuIHVwIHJhdy1tb2RlIG9wdGlvbnMiKQo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZp
ZyB8IDMgKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3Rt
MzJtcDE1X2Jhc2ljX2RlZmNvbmZpZwo+PiBpbmRleCAxYzBkMGQwYTA3My4uZGNmNDRiY2MwZTcg
MTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZwo+PiArKysg
Yi9jb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcKPj4gQEAgLTM4LDYgKzM4LDkgQEAg
Q09ORklHX1NQTF9TWVNfTUFMTE9DPXkKPj4gwqAgQ09ORklHX1NQTF9IQVNfQ1VTVE9NX01BTExP
Q19TVEFSVD15Cj4+IMKgIENPTkZJR19TUExfQ1VTVE9NX1NZU19NQUxMT0NfQUREUj0weGMwMzAw
MDAwCj4+IMKgIENPTkZJR19TUExfU1lTX01BTExPQ19TSVpFPTB4MWQwMDAwMAo+PiArQ09ORklH
X1NQTF9TWVNfTU1DU0RfUkFXX01PREU9eQo+PiArQ09ORklHX1NZU19NTUNTRF9SQVdfTU9ERV9V
X0JPT1RfVVNFX1BBUlRJVElPTj15Cj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1VfQk9P
VF9QQVJUSVRJT049MHgzCj4+IMKgIENPTkZJR19TUExfRU5WX1NVUFBPUlQ9eQo+PiDCoCBDT05G
SUdfU1BMX0kyQz15Cj4+IMKgIENPTkZJR19TUExfTVREPXkKPiAKPiAKPiBSZXZpZXdlZC1ieTog
UGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFu
a3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtz
ClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK
