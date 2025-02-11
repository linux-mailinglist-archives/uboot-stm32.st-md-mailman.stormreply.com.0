Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66797A30601
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 09:41:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B584C78F7B;
	Tue, 11 Feb 2025 08:41:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DED44C71289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 08:41:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B4pJCR016137;
 Tue, 11 Feb 2025 09:40:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 f0x6fFRvlN9F9K10m+o0UFIcOiLpDOgs50/9QWIqbb8=; b=b9/D1p1D8f587QYd
 2QCtWYC93eCZTpSW0SU0OHuLfM39fADm7UmhltjNONeFnNgq3686USoZ/05LDbJt
 853D/ry6pG3bkH2r25R7zbCTicJ5EIGXoi81FrD+Y2fPsXATO6J2vS0bkm7gc9FE
 fZ29mabrPnolvKMtwPeVx5V1HWewb+J4VlalstfJcPpH8pKdDXU4QCzvkq7jfI2f
 AO3yCIojtvbweYCKxE2J3WKkpcEzeCucH2PgAyUgflXxNTzO9EQdu+tp1yhw6lrM
 7T34Wx6oivVuf90PfIRWW6gRZBcTU8vGRA12C58wN/9PNezhsk2x9WtYOHe957nT
 tLr1fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0rj2brj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2025 09:40:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 70E434004B;
 Tue, 11 Feb 2025 09:38:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A3982CED31;
 Tue, 11 Feb 2025 09:24:24 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Feb
 2025 09:24:23 +0100
Message-ID: <e5b559c2-ce51-4469-9fc3-a9da6132351e@foss.st.com>
Date: Tue, 11 Feb 2025 09:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Marek Vasut
 <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
 <4492fe8a-1b60-44da-93b7-383eae3fa269@foss.st.com>
 <c8790ad9-0e81-4780-8da8-bbc06377c360@denx.de> <87ikpg6hkh.fsf@baylibre.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <87ikpg6hkh.fsf@baylibre.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Mathieu Othacehe <othacehe@gnu.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [Uboot-stm32] [PATCH v5 0/9] Restore USB and add UMS support
	for STiH407-B2260
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

CgpPbiAyLzExLzI1IDA4OjU1LCBNYXR0aWpzIEtvcnBlcnNob2VrIHdyb3RlOgo+IEhpIFBhdHJp
Y2UsIE1hcmVrLAo+IAo+IE9uIGx1bi4sIGbDqXZyLiAxMCwgMjAyNSBhdCAxNDo0MiwgTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+IHdyb3RlOgo+IAo+PiBPbiAyLzEwLzI1IDExOjI4IEFNLCBQ
YXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Pgo+Pj4gSGkgTWFyZWsKPj4KPj4gSGksCj4+Cj4+PiBB
bnkgY2hhbmNlIHRvIGdldCB0aGlzIHNlcmllcyBtZXJnZWQgaW4gbmV4dCBVLUJvb3QgdGFnIDIw
MjUuMDQtcmMyID8KPj4gR2FkZ2V0IHN0dWZmIGlzIG9uIE1hdHRpanMgZGVzaywgcGxlYXNlIHBp
bmcgbWUgaW4gYSBmZXcgZGF5cyBpZiBoZSAKPj4gZG9lc24ndCBwaWNrIGl0IHVwLCBJJ2xsIGRv
IHNvIHRoZW4uIFNvcnJ5IGZvciB0aGUgZGVsYXkuCj4gCj4gU29ycnkgYWJvdXQgdGhlIGRlbGF5
LCBJIG1pc3NlZCB0aGlzIHNlcmllcyBiZWNhdXNlIGl0IHdhcyBub3QgYXNzaWduZWQKPiB0byBt
ZSBvbiBwYXRjaHdvcmsuCj4gCj4gSSB3aWxsIHBpY2sgaXQgdXAgc2hvcnRseS4KCk5vIHdvcnJp
ZXMsIHRoYW5rcyBNYXJlaywgTWF0dGlqcwoKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
