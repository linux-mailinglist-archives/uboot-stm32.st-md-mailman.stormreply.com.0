Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99E5FEE65
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 15:10:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E44AC6411E;
	Fri, 14 Oct 2022 13:10:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 328FDC640FF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 13:10:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EALMmu021647;
 Fri, 14 Oct 2022 15:10:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3Iuawu0Aotrt23bGDui/SoWMpgHfR0u5QTcd4cMCGv4=;
 b=DQQiQIHMpL0yBEJBLRJSkPQRR9iuMLzlonEaEUxZziQlguGiUrmrbeOXT+e7m6ISBnex
 79iD97k5XFpLqmQFSYO/kwGgusgeoHjhya4pVK8qsfpdR6EupzK5WHbC5S1xTGymZFJ4
 f3lAD8EMaBcm9Yi+VLweK1N1KYogjZfwA8jc37rcasq4so5o4EZSK3Q0AYKQUu26mtp8
 2aHIXzgjsIadmhKdgGbKGk3X27j0s7UkN7A1fJ/E2qltfDBSnPE7D1Ww3PSMBXR0CW8C
 Y9Emed8CqnLzlKB6fEskSImxqanXv3vFmlTXWYAyFyBseE98QuVajLKrXrRgyn/ZzfwY gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k64m7wk7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:10:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD082100038;
 Fri, 14 Oct 2022 15:10:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B945B22AFF2;
 Fri, 14 Oct 2022 15:10:35 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 15:10:35 +0200
Message-ID: <4726e99d-2bf8-fc1d-715f-df9240ab69e4@foss.st.com>
Date: Fri, 14 Oct 2022 15:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Pralay Panchwate <pralay@melodyinnovations.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <bernard.puel@st.com>
References: <CACBcyETUAQHgXB7XKho4n44enk-uaPBotqfCAyQx8-qcAivOZQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CACBcyETUAQHgXB7XKho4n44enk-uaPBotqfCAyQx8-qcAivOZQ@mail.gmail.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_07,2022-10-14_01,2022-06-22_01
Subject: Re: [Uboot-stm32] Issues with Loading Linux OS on our custom made
 STM32 SOM board
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

SGkgQmVybmFyZCwKCmNhbiB5b3UgZm9sbG93IHRoaXMgY3VzdG9tZXIgcmVxdWVzdC4KCgpTZWUg
aW4gdGhlIG1haWwgYSBmaXJzdCBlbGVtZW50IG9mIGFuc3dlci4KCgpTZWUgYWxzbzoKCmh0dHBz
Oi8vY29tbXVuaXR5LnN0LmNvbS9zL2FydGljbGUvRkFRLVNUTTMyTVAxLUJyaW5nLXVwLXByb2Nl
ZHVyZQoKaHR0cHM6Ly9jb21tdW5pdHkuc3QuY29tL3MvYXJ0aWNsZS9GQVEtU1RNMzJNUDEtYnJp
bmctdXAtdHJvdWJsZXNob290aW5nLWd1aWRlCgoKClRoYW5rcywKClBhdHJpY2sKCgpPbiAxMC8x
My8yMiAxMTowNCwgUHJhbGF5IFBhbmNod2F0ZSB3cm90ZToKPiBIZWxsbyBFdmVyeW9uZSwKPiBX
ZSBhcmUgaW4gdGhlIGRldmVsb3BtZW50IHBoYXNlIG9mIG91ciBvd24gY3VzdG9tIG1hZGUgU09N
IGJvYXJkIHVzaW5nIAo+IFNUTTMyTVAxNTdBIGNoaXAuCj4gQ2FuIHdlIHVzZSBTVE0zMk1QMTU3
QS1FVjEgaW1hZ2UgZm9yIGZsYXNoaW5nIG91ciBjdXN0b20gU1RNMzJNUDEgCj4gYmFzZWQgYm9h
cmQgPwoKCk5PID0+IHlvdSBuZWVkIHRvIGFkYXB0IHRoZSBib290bG9hZGVycyAoVEYtQSBhbmQg
VS1Cb290KSBmb3IgeW91ciAKY3VzdG9tIGJvYXJkLCBpbiBwYXJ0aWN1bGFyIHRoZSBERFIgYW5k
IHRoZSBVU0IgcGFydAoKCj4gV2UgdHJpZWQgYnVybmluZyBvdXIgU1RNMzJNUDEgYm9hcmQgd2l0
aCBleGlzdGluZyAKPiAiKkZsYXNoTGF5b3V0X2VtbWNfc3RtMzJtcDE1N2EtZXYxLXRydXN0ZWQu
dHN2KiIgZmlsZSBidXQgaXQgdGhyb3dzIAo+IGZvbGxvd2luZyBlcnJvciAtCj4KPiDCoEVycm9y
OiBUU1YgZmlsZXMgYXJlIG9ubHkgc3VwcG9ydGVkIGZvciBTVE0zMk1QCj4KPiBXZSdyZSB1c2lu
ZyBhbiBvbmJvYXJkIGVNTUMgKEZyb20gS2lveGlhKSBhbmQgU1RNMzJNUDE1N0FBRDMgY2hpcCBm
cm9tIAo+IFNULiBJIGhhdmUgYXR0YWNoZWQgc25hcHNob3Qgb2YgbG9nLiBhbmQgSSdtIGV4dHJl
bWVseSBpbiBuZWVkIG9mIHN1cHBvcnQKPgo+IEJlbG93IGlzIHRoZSBMT0c6Cj4KPiB8Cj4KPiAg
MS4gdXNlckB1c2VyOn4vU1RNMzJNUFUtRWNvc3lzdGVtLXY0LjAuMC9TdGFydGVyLVBhY2thZ2Uv
c3RtMzJtcDEtb3BlbnN0bGludXgtNS4xNS15b2N0by1raXJrc3RvbmUtbXAxLXYyMi4wNi4xNS9p
bWFnZXMvc3RtMzJtcDEkCj4gICAgIFNUTTMyX1Byb2dyYW1tZXJfQ0xJIC1jIHBvcnQ9dXNiMSAt
dwo+ICAgICBmbGFzaGxheW91dF9zdC1pbWFnZS13ZXN0b24vdHJ1c3RlZC9GbGFzaExheW91dF9l
bW1jX3N0bTMybXAxNTdhLWV2MS10cnVzdGVkLnRzdgo+Cj4gIDIuIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMy4g
U1RNMzJDdWJlUHJvZ3JhbW1lciB2Mi4xMS4wCj4gIDQuIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA1Lgo+IDYuCj4g
Ny4KPiAgOC4gVVNCIHNwZWVkIDpIaWdoU3BlZWQoNDgwTUJpdC9zKQo+ICA5LiBNYW51Zi5JRCA6
U1RNaWNyb2VsZWN0cm9uaWNzCj4gMTAuIFByb2R1Y3RJRCA6REZVIGluSFMgTW9kZUBEZXZpY2VJ
RCAvMHg1MDAsQFJldmlzaW9uSUQgLzB4MDAwMAo+IDExLiBTTiA6MDAxOTAwMkMzNDMxNTExNzMz
MzUzNDMxCj4gMTIuIERGVSBwcm90b2NvbDoxLjEKPiAxMy4gQm9hcmQ6LS0KPiAxNC4gRGV2aWNl
SUQgOjB4MDUwMAo+IDE1LiBEZXZpY2VuYW1lIDpTVE0zMk1QMQo+IDE2LiBEZXZpY2V0eXBlIDpN
UFUKPiAxNy4gUmV2aXNpb25JRCA6LS0KPiAxOC4gRGV2aWNlQ1BVIDpDb3J0ZXgtQTcKPjE5Lgo+
IDIwLiBTdGFydEVtYmVkZGVkRmxhc2hpbmdzZXJ2aWNlCj4yMS4KPgo+IHwKCgpIZXJlIGl0IGlz
IHRoZSBmaXJzdCBVU0IgZW51bWVyYXRpb24gaW4gUk9NLUNvZGUKCj0+IGFsbCBpcyBPSywgdGhl
IFNUTTMyTVAxNSBpcyBkZXRlY3RlZCB3aXRoIHx8CgojIHxEZXZpY2VJRCA6MHgwNTAwfAp8fAoK
ClRoZW4gVEYtQSBpcyBsb2FkZWQgaW4gaW50ZXJuYWwgUkFNIGFuZCBleGVjdXRlZC4uLi4KCgo+
IHwKPgo+IDEuCj4gMi4KPiAgMy4gTWVtb3J5UHJvZ3JhbW1pbmcuLi4KPiAgNC4gT3BlbmluZ2Fu
ZHBhcnNpbmcgZmlsZTp0Zi1hLXN0bTMybXAxNTdhLWV2MS11c2Iuc3RtMzIKPiAgNS4gRmlsZTp0
Zi1hLXN0bTMybXAxNTdhLWV2MS11c2Iuc3RtMzIKPiAgNi4gU2l6ZToyMjAuODJLQgo+ICA3LiBQ
YXJ0aXRpb25JRCA6MHgwMQo+IDguCj4gIDkuIERvd25sb2FkaW5Qcm9ncmVzczoKPiAxMC4gWz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09XTEwMCUKPjEx
Lgo+IDEyLiBGaWxlZG93bmxvYWQgY29tcGxldGUKPiAxMy4gVGltZWVsYXBzZWQgZHVyaW5nIGRv
d25sb2FkIG9wZXJhdGlvbjowMDowMDowMS4xNTAKPjE0Lgo+IDE1LiBSVU5OSU5HIFByb2dyYW0u
Li4KPiAxNi4gUGFydElEOjoweDAxCj4xNy4KPgo+IHwKCgpTVE0zMkN1YmVQcm9ncmFtbWVyIHJl
Y29ubmVjdGlvbiBmYWlsZWQgYWZ0ZXIgU1RBUlQgcmVxdWVzdAoKSSBhc3N1bWVkIHJlZW51bWVy
YXRpb24gRmFpbGVkID0+IFRGLUEgaXMgTk9UIHJ1bm5pbmcgaGVyZSAhCgoKSGVyZSB5b3UgbmVl
ZCB0byBjaGVjayB0aGUgVEYtQSBvdXRwdXQgb24gY29uc29sZSB1YXJ0IHRvIGNoZWNrIHRoZSAK
cmVwb3J0ZWQgZXJyb3JzLi4uLgoKCj4gfAo+Cj4gMS4KPiAgMi4gRXJyb3I6U3RhcnRvcGVyYXRp
b24gZmFpbGVkIGF0IHBhcnRpdGlvbiAweDAxCj4gIDMuIEVycm9yOlRTViBmbGFzaGluZyBzZXJ2
aWNlIGZhaWxlZAo+ICA0LiB1c2VyQHVzZXI6fi9TVE0zMk1QVS1FY29zeXN0ZW0tdjQuMC4wL1N0
YXJ0ZXItUGFja2FnZS9zdG0zMm1wMS1vcGVuc3RsaW51eC01LjE1LXlvY3RvLWtpcmtzdG9uZS1t
cDEtdjIyLjA2LjE1L2ltYWdlcy9zdG0zMm1wMSQKPiAgICAgU1RNMzJfUHJvZ3JhbW1lcl9DTEkg
LWMgcG9ydD11c2IxIC13Cj4gICAgIGZsYXNobGF5b3V0X3N0LWltYWdlLXdlc3Rvbi90cnVzdGVk
L0ZsYXNoTGF5b3V0X2VtbWNfc3RtMzJtcDE1N2EtZXYxLXRydXN0ZWQudHN2Cj4KPiAgNS4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICA2LiBTVE0zMkN1YmVQcm9ncmFtbWVyIHYyLjExLjAKPiAgNy4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IDguCj4gOS4KPjEwLgo+IDExLiBVU0Igc3BlZWQgOkhpZ2hTcGVlZCg0ODBNQml0L3MpCj4g
MTIuIE1hbnVmLklEIDoKPiAxMy4gUHJvZHVjdElEIDoKPiAxNC4gU04gOgo+IDE1LiBERlUgcHJv
dG9jb2w6MS4xCj4gMTYuIEJvYXJkOi0tCj4gMTcuIElBUAo+IDE4LiBFcnJvcjpUU1YgZmlsZXMg
YXJlIG9ubHkgc3VwcG9ydGVkIGZvclNUTTMyTVAKPgo+IHwKCgpBcyB0aGUgVEYtQSBpcyBub3Qg
cnVubmluZyBjb3JyZWN0bHkgaGVyZSwgdGhlIFVTQiBzdGFjayBkb24ndCBydW5uaW5nIAppbiBk
ZXZpY2UKCnRoZSBVU0IgZW51bWVyYXRpb24gZmFpbGVkLCBmb3IgdGhpcyBzZWNvbmQgVVNCIGNv
bm5lY3QgcmVxdWVzdAoKPT4gcHJvZHVjdCBjYW4ndCBiZSBkZXRlY3RlZCA9IHwiUHJvZHVjdElE
IDoifAoKfAp8Cgp8YnkgZGVmYXVsdCB0aGUgU1RNMzJDdWJlUHJvZ3JhbW1lciBhc3N1bWUgU1RN
MzIgTUNVfAoKfD0+IHRoZSAndHN2JyBvcHRlaW9uIGlzIG5vdCBzdXBwb3J0ZWQsIG9ubHkgc3Vw
cG9ydGVkIGZvciBTVE0zMiBNUFUgCihTVE0zMk1QMTV4IFNUTTMyTVAxM3gpCnwKCgo+IHwKPgo+
IFBsZWFzZSBoZWxwIHVzIGFuZCByZXZlcnQgb24gdGhpcyBwcm9ibGVtIEFTQVAuCj4gfAoKCkkg
bGV0IEJlcm5hcmQgaGVscCB5b3UKCgo+IHwKPgo+IHwKPiBSZWdhcmRzLAo+IFByYWxheSBQYW5j
aHdhdGUKPiBFbWJlZGRlZCBFbmdpbmVlcgo+IE1lbG9keSBpbm5vdmF0aW9ucyBwdnQgbHRkLgo+
IENvbnRhY3Q6ICs5MS05ODUwMjExNjIzCj4KPiBUaGUgaW5mb3JtYXRpb24gdHJhbnNtaXR0ZWQg
YnkgdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgCj4gcGVyc29uIG9yIGVudGl0
eSB0byB3aGljaCBpdCBpcyBhZGRyZXNzZWQuIFRoaXMgZW1haWwgbWF5IGNvbnRhaW4gCj4gcHJv
cHJpZXRhcnksIGJ1c2luZXNzLWNvbmZpZGVudGlhbCwgYW5kL29yIHByaXZpbGVnZWQgbWF0ZXJp
YWwuIElmIHlvdSAKPiBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNz
YWdlLCBiZSBhd2FyZSB0aGF0IGFueSB1c2UsIAo+IHJldmlldywgcmUtdHJhbnNtaXNzaW9uLCBk
aXN0cmlidXRpb24sIHJlcHJvZHVjdGlvbiBvciBhbnkgYWN0aW9uIAo+IHRha2VuIGluIHJlbGlh
bmNlIHVwb24gdGhpcyBtZXNzYWdlIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSAKPiBy
ZWNlaXZlZCB0aGlzIGluIGVycm9yLCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxl
dGUgdGhlIAo+IG1hdGVyaWFsIGZyb20gYWxsIGNvbXB1dGVycy4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0Cj4gVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IGh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
