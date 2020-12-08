Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 102FB2D30EB
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:25:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5843FC3FADB;
	Tue,  8 Dec 2020 17:25:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD879C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 17:25:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B8HMjEl032628; Tue, 8 Dec 2020 18:25:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BeaJVjDKj1ZgNlhiWUApL2TGNbK5CPleuvWwJsLlmHQ=;
 b=4DrslgjAD/SmAxM+1+LLtrx++aKR/jV3XIEeYWBZsi76qyiUxpFN9NKKxItlSAsdvsPm
 f33I0sVqOfwC1ZZR4ldboZZBL3NfJ+8xAEmgCLfpqgzzg4SKC6++2GvhWgU3jsaLGpCh
 11ne0iUjhawWbmiH5udayBwnXGxlJftJ7GkmCJ/QiMEQXVPJkqrUmky9zKrlH7pghXhK
 p4XeSb1g1aVNq2UxcSXl0Xh69T6+mySkC+S22tG3HLkicAdkMUht/+yOIY8ulkenv9vv
 4nKpHgg8mXnDZcH83T6bvxhUXkSdDFHN+exwtwSq3czUXtQ3PotGhEpj+85jrTs6xcNX Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 359wqn652v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 18:25:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 631E010002A;
 Tue,  8 Dec 2020 18:25:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5921922D0CD;
 Tue,  8 Dec 2020 18:25:15 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 18:25:14 +0100
To: <u-boot@lists.denx.de>
References: <20201201102920.84051-1-marex@denx.de>
 <20201201102920.84051-2-marex@denx.de>
 <ca080b136e214a3285da43b8fb044170@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <c49134c3-2235-9429-dd4c-34dab85ce877@foss.st.com>
Date: Tue, 8 Dec 2020 18:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca080b136e214a3285da43b8fb044170@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ARM: dts: stm32: Disable SDMMC1 CKIN
	feedback clock
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

SGkgTWFyZWssCgo+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IFNlbnQ6IG1h
cmRpIDEgZMOpY2VtYnJlIDIwMjAgMTE6MjkKPgo+IFRoZSBTVE0zMk1QMSBESENPTSBTb00gY2Fu
IGJlIGJ1aWx0IHdpdGggZWl0aGVyIGJ1cyB2b2x0YWdlIGxldmVsIHNoaWZ0ZXIgb3Igd2l0aG91
dCBvbmUgb24gdGhlIFNETU1DMSBpbnRlcmZhY2UuIEJlY2F1c2UgdGhlIFNETU1DMSBpbnRlcmZh
Y2UgaXMgbGltaXRlZCB0byA1MCBNSHogYW5kIGhlbmNlIFNEIGhpZ2gtc3BlZWQgYW55d2F5LCBk
aXNhYmxlIHRoZSBTRCBmZWVkYmFjayBjbG9jayB0byBwZXJtaXQgb3BlcmF0aW9uIG9mIHRoZSBz
YW1lIFUtQm9vdCBpbWFnZSBvbiBib3RoIFNvTSB3aXRoIGFuZCB3aXRob3V0IHZvbHRhZ2UgbGV2
ZWwgc2hpZnRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRl
Pgo+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4gQ2M6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPgo+IC0tLQo+ICAgYXJjaC9h
cm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLmR0c2kgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRo
Y29tLmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20uZHRzaQo+IGluZGV4IDkw
NDkyNDVjNWIuLmRhZmNjZTQzMjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAx
NXh4LWRoY29tLmR0c2kKPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20uZHRz
aQo+IEBAIC0zMzMsNyArMzMzLDYgQEAKPiAgIAlkaXNhYmxlLXdwOwo+ICAgCXN0LHNpZy1kaXI7
Cj4gICAJc3QsbmVnLWVkZ2U7Cj4gLQlzdCx1c2UtY2tpbjsKPiAgIAlidXMtd2lkdGggPSA8ND47
Cj4gICAJdm1tYy1zdXBwbHkgPSA8JnZkZF9zZD47Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+IC0t
Cj4gMi4yOS4yCj4KUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVu
YXlAZm9zcy5zdC5jb20+CgpUaGFua3MKClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
