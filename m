Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 894659F63A9
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53927C78014;
	Wed, 18 Dec 2024 10:45:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7212CC78014
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6oGRI032714;
 Wed, 18 Dec 2024 11:45:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1v80Ftk+nRYaEl5Hq5Z5upLaURMEmLRudrnyyFQM9Z0=; b=Gy8rPv3g0qozVLq0
 bCXf391nJ0ElZ3Cf8YF6dWYanFnqmBg4L/q2FrW5wUWJy+bdmASxY+1N6TgLJ4uP
 aMWmvQ2BmVpFCis5udMG5jsiwaxKjgisxJbqTv9i7UVCcKFnKnoR+b+bLH2QuaQA
 Ma3MQgfoWgx5Tzz7MZa/cbCvOzT/RVzndPwx725CirGFHzRxxhKsZC41wrzzt4S4
 RvrHW9Db/3K+2NX1GD3Csq77Sc43iXsou6ZtUzKEMXCEdjMqfHSkH9FVspXRuxUO
 NRTkt6IlVBsWxUucvuLw/j0X4+HAwqdEzKtKe7gGD77+YTTHuA5sH1NlbjNICeT4
 Bqvxng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ksfrh0nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 146FC4008C;
 Wed, 18 Dec 2024 11:44:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B0712576D2;
 Wed, 18 Dec 2024 11:43:44 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:43:44 +0100
Message-ID: <23546047-27da-4c3b-97f4-563ff47f4217@foss.st.com>
Date: Wed, 18 Dec 2024 11:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241216102219.347725-1-patrice.chotard@foss.st.com>
 <20241216102219.347725-5-patrice.chotard@foss.st.com>
 <7a1b6d9c-a368-4fc5-832e-82cf0f3b3d39@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7a1b6d9c-a368-4fc5-832e-82cf0f3b3d39@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 5/5] configs: stm32mp1: Restore boot SPL
 from sdcard for Engicam i.Core STM32MP1 C.TOUCH 2.0
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

CgpPbiAxMi8xOC8yNCAxMDoxNSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMi8xNi8yNCAxMToyMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBSZXN0b3JlIGJvb3Qg
U1BMIGZyb20gc2RjYXJkIGZvciBFbmdpY2FtIGkuQ29yZSBTVE0zMk1QMSBDLlRPVUNIIDIuMC4K
Pj4KPj4gRml4ZXM6IDJhMDBkNzNkMDgxYSAoInNwbDogbW1jOiBUcnkgdG8gY2xlYW4gdXAgcmF3
LW1vZGUgb3B0aW9ucyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1w
MTUtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyX2RlZmNvbmZpZyB8IDMgKysrCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
c3RtMzJtcDE1LW1pY3JvZ2VhLXN0bTMybXAxLW1pY3JvZGV2Ml9kZWZjb25maWcgYi9jb25maWdz
L3N0bTMybXAxNS1taWNyb2dlYS1zdG0zMm1wMS1taWNyb2RldjJfZGVmY29uZmlnCj4+IGluZGV4
IDhhMTYyMTZmOTI2Li5kMWE5MmNiZmJhYSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1w
MTUtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyX2RlZmNvbmZpZwo+PiArKysgYi9jb25maWdz
L3N0bTMybXAxNS1taWNyb2dlYS1zdG0zMm1wMS1taWNyb2RldjJfZGVmY29uZmlnCj4+IEBAIC0y
Nyw2ICsyNyw5IEBAIENPTkZJR19TUExfU1lTX01BTExPQz15Cj4+IMKgIENPTkZJR19TUExfSEFT
X0NVU1RPTV9NQUxMT0NfU1RBUlQ9eQo+PiDCoCBDT05GSUdfU1BMX0NVU1RPTV9TWVNfTUFMTE9D
X0FERFI9MHhjMDMwMDAwMAo+PiDCoCBDT05GSUdfU1BMX1NZU19NQUxMT0NfU0laRT0weDFkMDAw
MDAKPj4gK0NPTkZJR19TUExfU1lTX01NQ1NEX1JBV19NT0RFPXkKPj4gK0NPTkZJR19TWVNfTU1D
U0RfUkFXX01PREVfVV9CT09UX1VTRV9QQVJUSVRJT049eQo+PiArQ09ORklHX1NZU19NTUNTRF9S
QVdfTU9ERV9VX0JPT1RfUEFSVElUSU9OPTB4Mwo+PiDCoCBDT05GSUdfU1BMX0VOVl9TVVBQT1JU
PXkKPj4gwqAgQ09ORklHX1NQTF9JMkM9eQo+PiDCoCBDT05GSUdfU1BMX1BPV0VSPXkKPiAKPiAK
PiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMy
L21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
