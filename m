Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 981239F63AA
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59FD7C7801C;
	Wed, 18 Dec 2024 10:45:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1337C78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6oGRJ032714;
 Wed, 18 Dec 2024 11:45:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7/W3cNAHeZFBRMDHdFAdk2S+WV7m8aiFbuyO8gSxGqU=; b=RehoC2t/ml7R9yaX
 fSR0Gh9IvolVL/ypMt7qybnZe9DhEr6bd+gpZHqvZtRjHAz8a65qmGCvrPpapV7P
 wbnawI7jSzKncVJ1ZvW8mJ/wz/CLV0fsjqFobAfQ/7B8MbUvVuVxbBSVIrENmNlu
 MSnOnAYZLbeNm0d7WrDqzNqg4KxBfoMmXkAku5eD+XeYWMhXZYdjATu7lH2q5ZOK
 nBpJh1/FAK+kmE7hNVp+XN1kSG6q1M2dvpbYFnNJaB8Oi8u1FclS3842OuH+59b3
 RHXLLMown7b5YBl5FldAOuP+h0MjGFd6BTUNgoBjB/J5tbiCl4lHnezi1KkZG+k/
 lgllaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ksfrh0nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1468C4008B;
 Wed, 18 Dec 2024 11:44:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79548264504;
 Wed, 18 Dec 2024 11:43:36 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:43:35 +0100
Message-ID: <7599b675-9fc6-4954-97b0-8a2d42162a21@foss.st.com>
Date: Wed, 18 Dec 2024 11:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241216102219.347725-1-patrice.chotard@foss.st.com>
 <20241216102219.347725-4-patrice.chotard@foss.st.com>
 <b00ab92f-77c8-4cb0-a4da-4069cc2d40d3@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b00ab92f-77c8-4cb0-a4da-4069cc2d40d3@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/5] configs: stm32mp1: Restore boot SPL
 from sdcard for Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
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

CgpPbiAxMi8xOC8yNCAxMDoxNSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaQo+IAo+IE9u
IDEyLzE2LzI0IDExOjIyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFJlc3RvcmUgYm9vdCBT
UEwgZnJvbSBzZGNhcmQgZm9yIEVuZ2ljYW0gTWljcm9HRUEgU1RNMzJNUDEgTWljcm9EZXYgMi4w
IDciIE9GCj4+Cj4+IEZpeGVzOiAyYTAwZDczZDA4MWEgKCJzcGw6IG1tYzogVHJ5IHRvIGNsZWFu
IHVwIHJhdy1tb2RlIG9wdGlvbnMiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mv
c3RtMzJtcDE1LW1pY3JvZ2VhLXN0bTMybXAxLW1pY3JvZGV2Mi1vZjdfZGVmY29uZmlnIHwgMyAr
KysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvY29uZmlncy9zdG0zMm1wMTUtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyLW9mN19kZWZj
b25maWcgYi9jb25maWdzL3N0bTMybXAxNS1taWNyb2dlYS1zdG0zMm1wMS1taWNyb2RldjItb2Y3
X2RlZmNvbmZpZwo+PiBpbmRleCBiMzJmNzFkOTBlYi4uMzVkZjNlYTgwOWQgMTAwNjQ0Cj4+IC0t
LSBhL2NvbmZpZ3Mvc3RtMzJtcDE1LW1pY3JvZ2VhLXN0bTMybXAxLW1pY3JvZGV2Mi1vZjdfZGVm
Y29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1LW1pY3JvZ2VhLXN0bTMybXAxLW1pY3Jv
ZGV2Mi1vZjdfZGVmY29uZmlnCj4+IEBAIC0yNyw2ICsyNyw5IEBAIENPTkZJR19TUExfU1lTX01B
TExPQz15Cj4+IMKgIENPTkZJR19TUExfSEFTX0NVU1RPTV9NQUxMT0NfU1RBUlQ9eQo+PiDCoCBD
T05GSUdfU1BMX0NVU1RPTV9TWVNfTUFMTE9DX0FERFI9MHhjMDMwMDAwMAo+PiDCoCBDT05GSUdf
U1BMX1NZU19NQUxMT0NfU0laRT0weDFkMDAwMDAKPj4gK0NPTkZJR19TUExfU1lTX01NQ1NEX1JB
V19NT0RFPXkKPj4gK0NPTkZJR19TWVNfTU1DU0RfUkFXX01PREVfVV9CT09UX1VTRV9QQVJUSVRJ
T049eQo+PiArQ09ORklHX1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfUEFSVElUSU9OPTB4Mwo+
PiDCoCBDT05GSUdfU1BMX0VOVl9TVVBQT1JUPXkKPj4gwqAgQ09ORklHX1NQTF9JMkM9eQo+PiDC
oCBDT05GSUdfU1BMX1BPV0VSPXkKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5h
eSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4g
CkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
