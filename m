Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E22F47ED
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 10:48:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A05BC32EA8;
	Wed, 13 Jan 2021 09:48:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E514C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 09:48:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D9mSvH017471; Wed, 13 Jan 2021 10:48:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YVJE65pFoiUKcxTVy/ZchY5RS6LaO2Ey3f57ECOqdNE=;
 b=Z5fTk6zqYreAhi2SQmM0k0TehV2AzwEmfibc4DxPjC1mbubIncT7EOiImaMpxgcmRf5t
 2FeDoSD9aPMTpPcsJGizRAhwvg7SqWHvfmU45kFimojTNgspEZo2v+g83/qKcHugspUk
 G0toNKGfCYrOhZV7dVXFouC3ckgt0DFtddZ2paCHBh5ePzJbCOeHMAqYDL+rZNKnFX6S
 VsliakTCYCBJw5ghVkoPU38yjbuURc+xwPQdpqQL9pmNm96lsZ7oT0iclxGJmL/vsx8E
 CV7dsJMKCkki7oYVKDO6+sqTxdMrL4ZzyGkX1TvDFZGZG0TU4ofECx8HNh7jxE1vEfGB Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kypeea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 10:48:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACE4910002A;
 Wed, 13 Jan 2021 10:48:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EA6222DC22;
 Wed, 13 Jan 2021 10:48:24 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 10:48:23 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
 <f8971553-1707-481d-b9a7-87acff670dc8@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <7274fcd6-228f-80f8-b24b-b21390585514@foss.st.com>
Date: Wed, 13 Jan 2021 10:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8971553-1707-481d-b9a7-87acff670dc8@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_05:2021-01-13,
 2021-01-13 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
	v5.11-rc2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWssCgpPbiAxLzExLzIxIDE6MTUgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEv
MTEvMjEgMTI6MzMgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IERldmljZSB0cmVlIGFs
aWdubWVudCB3aXRoIExpbnV4IGtlcm5lbCB2NS4xMS1yYzIKPj4gLSBmaXggRENNSSBETUEgZmVh
dHVyZXMgb24gc3RtMzJtcDE1IGZhbWlseQo+PiAtIEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBG
TUMgRUJJIGJ1cwo+PiAtIEhhcm1vbml6ZSBFSENJL09IQ0kgRFQgbm9kZXMgbmFtZSBvbiBzdG0z
Mm1wMTUKPj4gLSB1cGRhdGUgc2RtbWMgSVAgdmVyc2lvbiBmb3IgU1RNMzJNUDE1Cj4+IC0gQWRk
IExQIHRpbWVyIGlycXMgb24gc3RtMzJtcDE1MQo+PiAtIEFkZCBMUCB0aW1lciB3YWtldXAtc291
cmNlIG9uIHN0bTMybXAxNTEKPj4gLSBlbmFibGUgSEFTSCBieSBkZWZhdWx0IG9uIHN0bTMybXAx
NQo+PiAtIGVuYWJsZSBDUkMxIGJ5IGRlZmF1bHQgb24gc3RtMzJtcDE1Cj4+IC0gZW5hYmxlIENS
WVAgYnkgZGVmYXVsdCBvbiBzdG0zMm1wMTUKPj4gLSBzZXQgYnVzLXR5cGUgaW4gRENNSSBlbmRw
b2ludCBmb3Igc3RtMzJtcDE1N2MtZXYxIGJvYXJkCj4+IC0gcmVvcmRlciBzcGk0IHdpdGhpbiBz
dG0zMm1wMTUtcGluY3RybAo+PiAtIGFkZCBTVFVTQjE2MDAgVHlwZS1DIHVzaW5nIEkyQzQgb24g
c3RtMzJtcDE1eHgtZGt4Cj4+IC0gZml4IG1kbWExIGNsaWVudHMgY2hhbm5lbCBwcmlvcml0eSBs
ZXZlbCBvbiBzdG0zMm1wMTUxCj4+IC0gZml4IGRtYW11eCByZWcgcHJvcGVydHkgb24gc3RtMzJt
cDE1MQo+PiAtIGFkanVzdCBVU0IgT1RHIGdhZGdldCBmaWZvIHNpemVzIGluIHN0bTMybXAxNTEK
Pj4gLSB1cGRhdGUgc3RtMzJtcDE1MSBmb3IgcmVtb3RlIHByb2Mgc3luY2hyb25pemF0aW9uIHN1
cHBvcnQKPj4gLSBzdXBwb3J0IGNoaWxkIG1mZCBjZWxscyBmb3IgdGhlIHN0bTMybXAxIFRBTVAg
c3lzY29uCj4KPiBBcmUgeW91IGNvbXBsZXRlbHkgc3VyZSB0aGUgZGhjb20gYmFzZWQgYm9hcmRz
IGdlbmVyYXRlIHRoZSBzYW1lIERUIAo+IGFmdGVyIHRoZSBzeW5jID8KPgo+IEkgd291bGQgcmF0
aGVyIHByZWZlciBzeW5jIHdpdGggTGludXggNS4xMCAoTFRTKSwgb3IgaXMgdGhhdCBub3QgYW4g
Cj4gb3B0aW9uIGR1ZSB0byBzb21lIGV4dHJhIERUIHBhdGNoZXMgPwo+Cj4gRWl0aGVyIHdheSwg
aWYgeW91IGhhdmUgYW4gdXBzdHJlYW0gcXVldWUgZm9yIHRoaXMgRFQgc3luYyBzb21ld2hlcmUs
IAo+IHBsZWFzZSBnaXZlIG1lIGEgbGluaywgSSBwbGFuIHRvIHN5bmMgdGhlIGRoY29tIGJvYXJk
cyBhZnRlciAyMDIxLjAxIAo+IGlzIG91dCwgc28gSSB3b3VsZCBidWlsZCBvbiB0b3Agb2YgdGhh
dC4KCkkgYW0gc3VyZSB0aGUgRFQgaXMgbm90IHRoZSBzYW1lLCBzb3JyeS4KCkF0IGxlYXN0IGZv
ciB0aGUgU09DIHBhcnQgKG5ldyBub2RlcywgdXBkYXRlcyB2YWx1ZSkuCgpJIGNvbXBhcmUgdGhl
IGRoY29tIGRldmljZSB0cmVlIChkdHMgZmlsZSBmb3JtIGR0YikgYW5kIEkgZG9uJ3QgZm91bmQg
Cm1vZGlmaWNhdGlvbnMgZXhjZXB0IHRoZSBwaGFuZGxlIGNoYW5nZXMgYW5kIHRoZSBleHBlY3Rl
ZCBtb2RpZmljYXRpb25zLgoKQnV0IGl0IGlzIG5vdCBhIGV4aGF1c3RpdmUgY2hlY2suCgpGb3Ig
U1QgYm9hcmRzLCB0aGUgVS1Cb290IGRldmljZSB0cmVlcyBhcmUgYWxpZ25lZCB3aXRowqAgTGlu
dXggNS45IHNpbmNlIAp0aGUgY29tbWl0IDYyZjk1YWY5MmEzZmMyMWE3MmY1ZjMxOThmMGQwNjVj
YmQ3NzNmMDMgKCJBUk06IGR0czogCnN0bTMybXAxOiBEVCBhbGlnbm1lbnQgd2l0aCBMaW51eCBr
ZXJuZWwgdjUuOS1yYzQiKQoKSSBza2lwIHRoZSBMaW51eCA1LjEwIChMVFMpIGFzIGl0IGNvbWVz
IGFmdGVyIHYyMDIwLjEwIG1lcmdlIHdpbmRvd3MgYW5kIAp0aGUgNS4xMSBkZXZpY2UgdHJlZSBh
cmUgYWxyZWFkeSB1cGRhdGVkIChwdWxsIHJlcXVlc3QgZnJvbSBBbGV4YW5kcmUgClRvcmd1ZSA9
IApodHRwczovL2tlcm5lbC5nb29nbGVzb3VyY2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9hdG9yZ3VlL3N0bTMyKQoKQnV0IGlmIHlvdSBwcmVmZXIgSSBjYW4gc3BsaXQgaXQgaW4gMiBz
dGVwcwoKMS8gRGV2aWNlIHRyZWUgYWxpZ25tZW50IHdpdGggTGludXgga2VybmVsIHY1LjEwIChM
VFMpCgoyLyBEZXZpY2UgdHJlZSBhbGlnbm1lbnQgd2l0aCBMaW51eCBrZXJuZWwgdjUuMTEtcmMy
CgpUb2RheSB0aGUgcGF0Y2ggaXMgcHJlc2VudCBpbiBuZXh0IGJyYW5jaCBvZiBzdG0gY3VzdG9k
aWFucyAKKGh0dHBzOi8vZ2l0bGFiLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0
bS8tL3RyZWUvbmV4dCkKCkFuZCBJIGFtIHByZXBhcmluZyBhIHB1bGwgcmVxdWVzdCBmb3IgdGhl
IG1hc3RlciBicmFuY2guCgpQYXRyaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
